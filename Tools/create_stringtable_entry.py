#!/usr/bin/env python3
"""
create_stringtable_entry.py

Create a <Key> entry for the project's Stringtable.xml based on detected languages.
Usage:
  python create_stringtable_entry.py --file PATH --id KEY_ID --text "Original text"

Options:
  --file PATH    Path to Stringtable.xml to detect language tags (default: look for A3A/addons/scrt/Stringtable.xml)
  --id KEY_ID    The key ID to create (required)
  --text TEXT    The Original text (required)
  --insert       If provided, insert the generated block before the closing </StringTable> in the file (creates a backup with .bak)

The script prints the generated <Key> block to stdout. If --insert is used it will also modify the file.
"""

import argparse
import sys
import re
from xml.etree import ElementTree as ET
from pathlib import Path
import json
import urllib.parse
import urllib.request
from typing import List

DEFAULT_PATH = Path(__file__).resolve().parents[1] / 'A3A' / 'addons' / 'scrt' / 'Stringtable.xml'

# Default fixed language tag order used when creating templates
LANG_TAG_ORDER = [
    'Original', 'German', 'Italian', 'Spanish', 'French', 'Korean',
    'Japanese', 'Russian', 'Polish', 'Czech', 'Portuguese', 'Chinesesimp',
    'Turkish'
]


def detect_language_tags(xml_path: Path):
    """Return the fixed ordered list of language tags.

    The script no longer auto-detects languages from existing files. Instead it
    always uses the canonical template order requested by the user.
    """
    return LANG_TAG_ORDER.copy()


def make_key_block(key_id: str, original_text: str, tags):
    """Return a string with the formatted <Key> block.
    tags is an ordered list of language tag names, must include 'Original'.
    """
    sb = []
    sb.append(f'            <Key ID="{escape_xml_attr(key_id)}">')
    for tag in tags:
        if tag == 'Original':
            text = original_text
        else:
            text = ''
        sb.append(f'                <{tag}>{escape_xml_text(text)}</{tag}>')
    sb.append('            </Key>')
    return '\n'.join(sb)


def escape_xml_text(s: str) -> str:
    return (s.replace('&', '&amp;')
             .replace('<', '&lt;')
             .replace('>', '&gt;'))


def escape_xml_attr(s: str) -> str:
    return (s.replace('&', '&amp;')
             .replace('"', '&quot;')
             .replace("'", '&apos;')
             .replace('<', '&lt;')
             .replace('>', '&gt;'))


def insert_before_closing(xml_path: Path, block_text: str):
    backup = xml_path.with_suffix(xml_path.suffix + '.bak')
    xml_text = xml_path.read_text(encoding='utf-8')
    if '</StringTable>' not in xml_text:
        print('Closing </StringTable> tag not found; aborting insert.', file=sys.stderr)
        return False
    # create backup
    backup.write_text(xml_text, encoding='utf-8')
    new_text = xml_text.replace('</StringTable>', block_text + '\n</StringTable>')
    xml_path.write_text(new_text, encoding='utf-8')
    return True


def translate_texts(original: str, tags: List[str], api_key_file: Path):
    """Return a dict mapping tag -> translated text. Uses Google Translate v2 API key from file.
    api_key_file should contain the raw API key string or a JSON with {"key": "..."}.
    Only translatable tags (not 'Original') are translated; unknown tags are skipped.
    """
    # Map common language tags to Google Translate codes
    tag_to_lang = {
        'German': 'de',
        'Italian': 'it',
        'Spanish': 'es',
        'French': 'fr',
        'Korean': 'ko',
        'Japanese': 'ja',
        'Russian': 'ru',
        'Polish': 'pl',
        'Czech': 'cs',
        'Portuguese': 'pt',
        'Chinesesimp': 'zh-CN',
        'Turkish': 'tr'
    }

    # load key
    key_text = api_key_file.read_text(encoding='utf-8').strip()
    try:
        j = json.loads(key_text)
        api_key = j.get('key', key_text)
    except Exception:
        api_key = key_text

    translations = {}
    for tag in tags:
        if tag == 'Original':
            translations[tag] = original
            continue
        lang = tag_to_lang.get(tag)
        if not lang:
            translations[tag] = ''
            continue

        # Google Translate v2 API endpoint
        url = 'https://translation.googleapis.com/language/translate/v2'
        params = {
            'q': original,
            'target': lang,
            'format': 'text',
            'key': api_key
        }
        data = urllib.parse.urlencode(params).encode('utf-8')
        req = urllib.request.Request(url, data=data, method='POST')
        try:
            with urllib.request.urlopen(req, timeout=15) as resp:
                resp_text = resp.read().decode('utf-8')
                res = json.loads(resp_text)
                translated = res['data']['translations'][0]['translatedText']
                translations[tag] = translated
        except Exception as e:
            print(f'Warning: translation failed for {tag}: {e}', file=sys.stderr)
            translations[tag] = ''

    return translations


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', '-f', default=str(DEFAULT_PATH), help='Path to Stringtable.xml')
    parser.add_argument('--id', '-i', required=True, help='Key ID to create')
    parser.add_argument('--text', '-t', required=True, help='Original text')
    parser.add_argument('--insert', action='store_true', help='Insert block into file before closing </StringTable>')
    parser.add_argument('--template', action='store_true', help='Auto-fill translations using Google Translate API')
    parser.add_argument('--key-file', help='Path to file containing Google Translate API key (raw key or JSON {"key":"..."})')
    args = parser.parse_args()

    xml_path = Path(args.file)
    if not xml_path.exists():
        print(f"File not found: {xml_path}", file=sys.stderr)
        sys.exit(2)

    tags = detect_language_tags(xml_path)
    if 'Original' not in tags:
        tags.insert(0, 'Original')

    # prepare translations
    translated_map = None
    if args.template:
        if not args.key_file:
            print('Error: --template requires --key-file to be provided', file=sys.stderr)
            sys.exit(2)
        key_path = Path(args.key_file)
        if not key_path.exists():
            print(f'Error: key file not found: {key_path}', file=sys.stderr)
            sys.exit(2)
        translated_map = translate_texts(args.text, tags, key_path)

    # build block using translations if available
    if translated_map:
        # make a block assembling each tag's content
        sb = []
        sb.append(f'            <Key ID="{escape_xml_attr(args.id)}">')
        for tag in tags:
            content = translated_map.get(tag, '')
            sb.append(f'                <{tag}>{escape_xml_text(content)}</{tag}>')
        sb.append('            </Key>')
        block = '\n'.join(sb)
    else:
        block = make_key_block(args.id, args.text, tags)
    print(block)

    if args.insert:
        success = insert_before_closing(xml_path, '\n' + block)
        if success:
            print(f'Inserted block into {xml_path} (backup at {xml_path}.bak)')
        else:
            print('Failed to insert block.', file=sys.stderr)


if __name__ == '__main__':
    main()
