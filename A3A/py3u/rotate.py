"""
Logrotate-style retention for exported save files.

The newest export keeps its plain name (e.g. savedata55039.json). Superseded exports are
archived as savedata55039_YYYYmmdd-HHMMSS.json and sorted into tiers by age, keeping one
file per bucket (day / ISO week / month / year):

    daily    age < 7 days      one per day
    weekly   age < 28 days     one per ISO week
    monthly  age < 365 days    one per month
    yearly   older             one per year

Maintainer: jwoodruff40 / Creep'nCrunch
"""
import os
import re
import shutil
from datetime import datetime, timedelta

TIMESTAMP_FORMAT = "%Y%m%d-%H%M%S"

# (folder, max age, bucket key); the last tier has no age limit.
TIERS = [
    ("daily", timedelta(days=7), lambda t: (t.year, t.month, t.day)),
    ("weekly", timedelta(days=28), lambda t: t.isocalendar()[:2]),
    ("monthly", timedelta(days=365), lambda t: (t.year, t.month)),
    ("yearly", None, lambda t: (t.year,)),
]


def archive_current(export_dir: str, name: str, extension: str) -> None:
    """Move the current export into daily/ with a timestamp taken from its mtime."""
    current = os.path.join(export_dir, f"{name}.{extension}")
    if not os.path.isfile(current):
        return
    stamp = datetime.fromtimestamp(os.path.getmtime(current)).strftime(TIMESTAMP_FORMAT)
    daily_dir = os.path.join(export_dir, "daily")
    os.makedirs(daily_dir, exist_ok=True)
    shutil.move(current, os.path.join(daily_dir, f"{name}_{stamp}.{extension}"))


def rotate(export_dir: str, name: str, extension: str, now: datetime | None = None) -> None:
    """Re-sort archived exports of `name` into tiers and delete extras within each bucket."""
    now = now or datetime.now()
    pattern = re.compile(rf"^{re.escape(name)}_(\d{{8}}-\d{{6}})\.{re.escape(extension)}$")

    archived = []  # (timestamp, path)
    for tier, _, _ in TIERS:
        tier_dir = os.path.join(export_dir, tier)
        if not os.path.isdir(tier_dir):
            continue
        for file_name in os.listdir(tier_dir):
            match = pattern.match(file_name)
            if match:
                stamp = datetime.strptime(match.group(1), TIMESTAMP_FORMAT)
                archived.append((stamp, os.path.join(tier_dir, file_name)))

    # Newest first so the first file seen in each bucket is the one kept.
    archived.sort(key=lambda item: item[0], reverse=True)
    seen = set()
    for stamp, path in archived:
        age = now - stamp
        for tier, max_age, bucket in TIERS:
            if max_age is None or age < max_age:
                break
        key = (tier, bucket(stamp))
        if key in seen:
            os.remove(path)
            continue
        seen.add(key)

        target_dir = os.path.join(export_dir, tier)
        if os.path.dirname(path) != target_dir:
            os.makedirs(target_dir, exist_ok=True)
            shutil.move(path, os.path.join(target_dir, os.path.basename(path)))
