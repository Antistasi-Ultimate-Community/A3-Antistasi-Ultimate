create_stringtable_entry.py

This helper script generates a properly formatted <Key> block for the project's `Stringtable.xml`.

Usage examples (PowerShell):

# Print a block to stdout using detected languages from default path
python .\Tools\create_stringtable_entry.py --id STR_example_key --text "Example original text"

# Print a block using a custom stringtable path
python .\Tools\create_stringtable_entry.py --file "e:\Games\Mod Stuff\Arma\A3-Antistasi-Ultimate\A3A\addons\scrt\Stringtable.xml" --id STR_example_key --text "Example original text"

# Insert the block into the file before </StringTable> (creates .bak backup)
python .\Tools\create_stringtable_entry.py --id STR_example_key --text "Example original text" --insert

Automatic translation template
--------------------------------
The script now creates a canonical template containing the following language tags in this exact order:

- Original
- German
- Italian
- Spanish
- French
- Korean
- Russian
- Polish
- Czech
- PortugueseBR (Brazilian Portuguese)
- Chinesesimp (Simplified Chinese)

Use --template and --key-file if you want the script to auto-fill translations via Google Cloud Translation API (v2).

The key file may contain either the raw API key string or a small JSON object like:

{
	"key": "YOUR_GOOGLE_API_KEY"
}

Example (preview only):
python .\Tools\create_stringtable_entry.py --id STR_example_key --text "Example original text" --template --key-file .\my_google_key.json

Example (insert):
python .\Tools\create_stringtable_entry.py --id STR_example_key --text "Example original text" --template --key-file .\my_google_key.json --insert

Security note: keep your API key file out of version control (add to .gitignore). The script creates a .bak when inserting but does not store keys.

Notes:
- The script detects language child tags present in the first <Key> it finds and uses that order.
- It always includes an <Original> tag and leaves other language translations empty for manual editing.
- The script creates a .bak backup when inserting.
