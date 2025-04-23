import csv
import os

import parse_operations

prefix = ""

directory = os.getcwd()

parse_operations.parse_all_csv_files_in_dir(prefix)