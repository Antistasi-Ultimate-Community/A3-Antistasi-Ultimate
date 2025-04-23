import csv
import os

def grab_csv_files_in_dir(directory=os.getcwd(), prefix=""):
    directory = f"{directory}/csv"
    directories = os.listdir(directory)

    print(directories)

    files = []

    for file in directories:
        if os.path.isfile(f"csv/{file}"):
            if file.endswith(".csv"):
                if (prefix == ""):
                    filename = file
                else:
                    filename = file.split(" - ")[1]

                files.append(filename)

    return files