import json

def write_data(file_name: str, file_content: str, file_type: str) -> bool:
    if file_type == "json":
        data: dict = json.loads(file_content)
    else:
        data = file_content
    
    try:
        print(f"Writing {file_name}.{file_type} ...")
        with open(f"{file_name}.{file_type}", "w") as file:
            if file_type == "json":
                json.dump(data, file, indent=4)
            else:
                file.write(data)
    except PermissionError:
        print(f"Permission error: {file_name}.{file_type} cannot be written")
        return False
    
    return True
