#!/usr/bin/env python3
"""
Removes <Key> elements whose IDs are listed in a text file from an XML localization file.
Creates a backup (.bak).
"""

import sys
import xml.etree.ElementTree as ET
import shutil
from pathlib import Path

def read_keys_from_file(keys_path):
    """Read keys from a text file (one per line)."""
    keys = set()
    with open(keys_path, 'r', encoding='utf-8') as f:
        for line in f:
            key = line.strip()
            if key:
                keys.add(key)
    return keys

def remove_keys(xml_path, keys_to_remove):
    """Remove Key elements with the specified IDs from the XML file."""
    # Create backup
    backup_path = str(xml_path) + '.bak'
    shutil.copy2(xml_path, backup_path)
    print(f"Backup created: {backup_path}")

    # Parse XML
    tree = ET.parse(xml_path)
    root = tree.getroot()

    # Build parent map for reliable removal
    parent_map = {c: p for p in root.iter() for c in p}

    removed = 0
    for elem in list(root.findall(".//Key")):  # list() to avoid modification issues
        key_id = elem.get("ID")
        if key_id in keys_to_remove:
            parent = parent_map.get(elem)
            if parent is not None:
                parent.remove(elem)
                removed += 1
                print(f"Removed key: {key_id}")
            else:
                print(f"Could not find parent for {key_id}, skipped.")

    # Save changes
    tree.write(xml_path, encoding='utf-8', xml_declaration=True)
    return removed

def main():
    if len(sys.argv) != 3:
        print("Usage: python remove_keys_by_file.py <xml_file> <keys_txt_file>")
        sys.exit(1)

    xml_file = Path(sys.argv[1])
    keys_file = Path(sys.argv[2])

    if not xml_file.exists():
        print(f"Error: file {xml_file} not found.")
        sys.exit(1)
    if not keys_file.exists():
        print(f"Error: file {keys_file} not found.")
        sys.exit(1)

    keys_to_remove = read_keys_from_file(keys_file)
    if not keys_to_remove:
        print("Keys file is empty. Nothing removed.")
        return

    print(f"Loaded keys to remove: {len(keys_to_remove)}")
    removed = remove_keys(xml_file, keys_to_remove)
    print(f"Total Key elements removed: {removed}")

    if removed < len(keys_to_remove):
        print("Warning: not all specified keys were found in the XML.")

if __name__ == "__main__":
    main()