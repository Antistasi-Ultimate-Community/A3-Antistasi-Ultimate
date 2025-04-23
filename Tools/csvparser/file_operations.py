import csv
import os

def write_to_file(filename="output", data="", category="", extension="txt"):
    with open(f'output/{filename}_{category[0]}.{extension}', 'w+') as file:
        # file.write(str(data))
        for line in data:
            line = line.replace('"[[', "")
            line = line.replace(']]"', "") # Used to remove the string from things such as macros, which don't need strings in cfg
            file.write(str(line) + "\n")