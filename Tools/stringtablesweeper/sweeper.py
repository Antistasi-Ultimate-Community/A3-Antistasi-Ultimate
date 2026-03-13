#!/usr/bin/env python3
"""
Check localization keys from one XML file (e.g., stringtable.xml) against all text files
in a given folder (recursively). After the scan, interactively asks whether to save the
list of unused keys to a fixed file named "unused.txt".
"""

import os
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
import argparse

def extract_keys_from_xml(xml_path):
    """Extract all ID attribute values from Key elements in the XML file."""
    keys = set()
    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
        for key_elem in root.findall(".//Key"):
            key_id = key_elem.get("ID")
            if key_id:
                keys.add(key_id)
    except ET.ParseError as e:
        print(f"Error parsing {xml_path}: {e}", file=sys.stderr)
    except Exception as e:
        print(f"Error processing {xml_path}: {e}", file=sys.stderr)
    return keys

def is_text_file(file_path, blocksize=512):
    """Check if a file is text (by looking for null bytes)."""
    try:
        with open(file_path, 'rb') as f:
            raw = f.read(blocksize)
            if not raw:
                return False
            if b'\x00' in raw:
                return False
            return True
    except Exception:
        return False

def find_unused_keys(source_keys, target_dir, include_extensions=None, exclude_extensions=None, case_sensitive=True):
    """
    Check each key in source_keys for presence in any file under target_dir.
    Return the set of keys that were not found.
    """
    if not case_sensitive:
        source_keys_lower = {k.lower() for k in source_keys}
        key_map = {k.lower(): k for k in source_keys}
        search_keys = source_keys_lower
    else:
        search_keys = source_keys
        key_map = {k: k for k in source_keys}

    used_keys = set()
    total_files = 0
    processed_files = 0

    for root, dirs, files in os.walk(target_dir):
        for file in files:
            file_path = os.path.join(root, file)
            total_files += 1

            ext = os.path.splitext(file)[1].lower()
            if include_extensions and ext not in include_extensions:
                continue
            if exclude_extensions and ext in exclude_extensions:
                continue

            if not is_text_file(file_path):
                continue

            processed_files += 1
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if not case_sensitive:
                        content = content.lower()
                    for sk in search_keys:
                        if sk in content:
                            used_keys.add(sk)
            except Exception as e:
                print(f"Error reading {file_path}: {e}", file=sys.stderr)

    if not case_sensitive:
        unused_keys = {key_map[sk] for sk in search_keys - used_keys}
    else:
        unused_keys = search_keys - used_keys

    print(f"Total files: {total_files}, text files processed: {processed_files}", file=sys.stderr)
    return unused_keys

def main():
    parser = argparse.ArgumentParser(
        description="Check usage of localization keys in project files with interactive save."
    )
    parser.add_argument("source_xml", help="Path to the source XML localization file (e.g., stringtable.xml).")
    parser.add_argument("target_dir", help="Root folder to search for key usage (recursively).")
    parser.add_argument("--include-ext", nargs='+', help="List of file extensions to include (e.g., .txt .sqf .cpp). If not specified, all text files are checked.")
    parser.add_argument("--exclude-ext", nargs='+', help="List of file extensions to exclude.")
    parser.add_argument("--ignore-case", action="store_true", help="Ignore case when searching.")
    args = parser.parse_args()

    source_path = Path(args.source_xml)
    if not source_path.exists():
        print(f"Source file {args.source_xml} not found.", file=sys.stderr)
        sys.exit(1)

    print(f"Extracting keys from {source_path}...", file=sys.stderr)
    source_keys = extract_keys_from_xml(source_path)
    print(f"Found keys: {len(source_keys)}", file=sys.stderr)

    if not source_keys:
        print("No keys to check.", file=sys.stderr)
        return

    include_ext = None
    if args.include_ext:
        include_ext = set(ext if ext.startswith('.') else f'.{ext}' for ext in args.include_ext)
    exclude_ext = None
    if args.exclude_ext:
        exclude_ext = set(ext if ext.startswith('.') else f'.{ext}' for ext in args.exclude_ext)

    print(f"Searching for key usage in folder {args.target_dir}...", file=sys.stderr)
    unused = find_unused_keys(
        source_keys,
        args.target_dir,
        include_extensions=include_ext,
        exclude_extensions=exclude_ext,
        case_sensitive=not args.ignore_case
    )

    if unused:
        unused_sorted = sorted(unused)
        print("\nUnused keys found:", file=sys.stderr)
        for k in unused_sorted[:5]:
            print(f"  {k}", file=sys.stderr)
        if len(unused_sorted) > 5:
            print(f"  ... and {len(unused_sorted)-5} more", file=sys.stderr)

        # Interactive prompt
        while True:
            answer = input("\nSave the list of unused keys to unused.txt? (y/n): ").strip().lower()
            if answer in ('y', 'yes'):
                filename = "unused.txt"
                try:
                    with open(filename, 'w', encoding='utf-8') as f:
                        f.write("\n".join(unused_sorted) + "\n")
                    print(f"List saved to {filename}", file=sys.stderr)
                except Exception as e:
                    print(f"Error writing to file: {e}", file=sys.stderr)
                break
            elif answer in ('n', 'no'):
                # Output to stdout for potential redirection
                print("\n".join(unused_sorted))
                break
            else:
                print("Please answer y or n.", file=sys.stderr)
    else:
        print("All keys are used.", file=sys.stderr)

if __name__ == "__main__":
    main()