import csv
import os

def delete_csv_files_in_dir(directory=os.getcwd(), delete_all=False, folder="csv"):
    directory = f"{directory}/{folder}"
    directories = os.listdir(directory)

    files = []

    for file in directories:
        if os.path.isfile(f"{folder}/{file}"):
            if file.endswith(".csv") or file.endswith(".txt") or file.endswith(".hpp"):
                if (delete_all != True):
                    confirmation = input(f"Are you sure? This will delete {file}! (Y/N): ")

                    if (confirmation.lower() == "y" or confirmation.lower() == "yes"):
                        os.remove(f"{directory}/{file}")
                else:
                    os.remove(f"{directory}/{file}")

    return files

print("Which folder would you like to target?")
folder = input().lower()

del_all = input(f"Would you like to delete all files or do it one by one? (Y/N): ")

if (del_all.lower() == "y" or del_all.lower() == "yes"):
    delete_all = True
else:
    delete_all = False

delete_csv_files_in_dir(delete_all=delete_all, folder=folder)