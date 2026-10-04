"""
Py3U module to handle creating directory structure and reading / writing data for use in exporting data from Antistasi Ultimate.

Maintainer: jwoodruff40 / Creep'nCrunch
"""
import os
import re
import json
from . import rotate

def create_a3u_exports_dirs() -> bool:
    """Create the directory structure for Antistasi Ultimate exports.

    Returns:
        bool: True if the directories were created successfully or already exist, False otherwise.
    """
    try:
        os.makedirs("a3u_exports/pythia", exist_ok=True)
        for subfolder in ["daily", "weekly", "monthly", "yearly"]:
            os.makedirs(f"a3u_exports/pythia/{subfolder}", exist_ok=True)
        return True
    except PermissionError:
        print("Permission error: could not create a3u_exports directory structure")
        return False

def get_files(base_dir: str = "a3u_exports/pythia", pattern: str = ".*") -> list[str]:
    """Retrieve a list of save files from the Antistasi Ultimate exports directory whose file names match the given regex.
    If no pattern is specified, all files will be returned.

    Args:
        base_dir (str): The base directory to search for files.
        pattern (str): A regular expression searched for in each file name (not the full path).

    Returns:
        list[str]: A list of save file paths matching the pattern.
    """
    regex = re.compile(pattern)
    save_files = []
    if os.path.exists(base_dir):
        for root, _, files in os.walk(base_dir):
            for file in files:
                if regex.search(file):
                    save_files.append(os.path.join(root, file))
    return save_files

def read_data(file_path: str) -> str:
    """Read data from the appropriate export file.

    Args:
        file_path (str): The relative path to the file from the "Arma 3" directory, including the extension.
        
    Returns:
        str: The content of the file as a string, or an empty string if the file cannot be read.
    """
    if not os.path.exists(file_path):
        return ""
    try:
        with open(file_path, "r") as file:
            return file.read()
    except (PermissionError, OSError):
        print(f"Permission error: {file_path} cannot be read")
        return ""

def write_data(file_name: str, file_content: str, file_type: str) -> bool:
    """Write data to the appropriate export file, handling rotation.

    Args:
        file_name (str): The base name of the file (without extension).
        file_content (str): The content to write to the file.
        file_type (str): The type of the file (e.g., "json").

    Returns:
        bool: True if the file was written and rotated successfully, False otherwise.
    """
    if not os.path.exists("a3u_exports/pythia"):
        if not create_a3u_exports_dirs():
            return False
    
    if file_type == "json":
        data: dict = json.loads(file_content)
    else:
        data = file_content
    
    try:
        print(f"Writing {file_name}.{file_type} ...")
        export_dir = "a3u_exports/pythia"
        rotate.archive_current(export_dir, file_name, file_type)
        with open(f"{export_dir}/{file_name}.{file_type}", "w") as file:
            if file_type == "json":
                json.dump(data, file, indent=4)
            else:
                file.write(data)
        rotate.rotate(export_dir, file_name, file_type)
    except (PermissionError, OSError):
        print(f"Permission error: {file_name}.{file_type} cannot be written or rotated")
        return False
    
    return True
