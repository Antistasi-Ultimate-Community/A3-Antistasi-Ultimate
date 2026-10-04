"""
Py3U module to handle creating directory structure and writing files for use in exporting data from Antistasi Ultimate.

Maintainer: jwoodruff40 / Creep'nCrunch
"""
import os
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
