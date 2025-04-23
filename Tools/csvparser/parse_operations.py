import csv
import os

import file_operations
import csv_operations
from category import match_category
from category import match_category_macro

from common import *
from conditions import *

def parse_file(filename="armedcar", category_custom=""):
    
    print(f"\n<------- Currently parsing: {filename}.csv ------->\n")

    if filename != "":

        with open(f'csv/{filename}.csv', newline='', errors="ignore") as csvfile:
            reader = csv.reader(csvfile, delimiter=',', quotechar='|')
            data = read_parsed_file(reader, filename, category_custom)

    return data

def read_parsed_file(parsed_data, filename, category_custom=""):
    data_write = []
    classes = []
    cur_modset = ""

    modsets = []
    categories = []

    if (category_custom != ""):

        category = [category_custom]

    else:

        category = [filename]

    categories.extend(category)
    data_write.append(category)

    for row in parsed_data:
        row_joined = ":".join(row)
        row_split = row_joined.split(":")
        
        for test in [row_split]:
            if (test != ''):
                modset = test[0]
                classname = test[1]
                name = test[2]
                price = test[-1]

                # Not a fuckin clue, don't ask
                if (type(price) == str and price.isdigit()):
                    price = int(float(price))

                # If price isn't an integer (usually due to a comment in the last row), step back 1 element
                if (type(price) != int):
                    price = test[-1]
                    if (price == "" or price in comment_types): # fix comments that broke the parser
                        price = test[-2]

                # If price is a float, yeet that out
                # (int() didn't work)
                if (type(price) == str and "." in price):
                    price = price[:-2]
                    price = price.replace(".", "")

                data = [classname, name, price, category]
                
                # Grab the modset if applicable
                if (classname != "className" and name == "" and price == ""):
                    if (modset != cur_modset or cur_modset == ""):
                        cur_modset = modset.replace(".", "").lower()
                        cur_modset = modset.replace(" ", "").lower()
                        modsets.append(cur_modset)

                data.insert(0, cur_modset)

                # Get rid of data that isn't needed (headers, basically)
                if (classname == "className"):
                    data = ['', '', '']

                if ('' not in data):

                    data_write.append(data)

    return [data_write, modsets, categories]

def parse_all_csv_files_in_dir(prefix="BlackMarketVehicles - "):
    files = csv_operations.grab_csv_files_in_dir(prefix=prefix)

    all_vehicles = []
    all_categories = []
    all_classes = []
    all_includes = []

    for file in files:
        category_custom = file[:-4]

        print(file)

        if ("MODSETS" in file or "CONDITIONS" in file):
            continue

        if (prefix == ""):
            data = parse_file(f"{file[:-4]}", category_custom)
        else:
            data = parse_file(f"{prefix}{file[:-4]}", category_custom)

        data_vehicles = data[0]
        data_categories = data[2]

        all_vehicles.extend(data_vehicles)
        all_categories.extend(data_categories)
    
    list_dict = convert_list_to_dict(all_vehicles, all_categories)
    modsets = list(list_dict.keys())

    conditions = {}
    vehicle_conditions = []
    for vehicle_type in vehicle_types_common:

        condition = match_category(category=vehicle_type)

        conditions[vehicle_type] = condition

    for vehicle_type, condition in conditions.items():
        vehicle_condition_macro = f'#define VEHICLE_CONDITION_{vehicle_type} {condition}'
        vehicle_condition = f'condition_{vehicle_type} = "[[VEHICLE_CONDITION_{vehicle_type}]]";\n' # needs to be a common variable
        vehicle_conditions.append(vehicle_condition_macro)
        vehicle_conditions.append(vehicle_condition)

    for modset in modsets:
        includes = f'#include "vehicles_{modset}.hpp"'

        arma_classes = generate_config_list(list_dict, modset)
        all_classes.extend(arma_classes + ["\n"])
        all_includes.append(includes)
        file_operations.write_to_file("vehicles", arma_classes, [modset], extension="hpp")

    # file_operations.write_to_file("vehicles", all_classes, ["ALL"], extension="hpp") # uncomment to have all the classes merged into this file
    file_operations.write_to_file("vehicles", vehicle_conditions, ["conditions"], extension="hpp")
    file_operations.write_to_file("vehicles", all_includes, ["includes"], extension="hpp")

    print("Done")

def generate_config_list(list_data, modset):
    arma_classes = []
    mod_header = (f"class vehicles_{modset.lower()} : vehicles_base")
    arma_classes.append(mod_header + "\n{")
    
    vehicle_types = list(list_data[modset].keys())

    for vehicle_type in vehicle_types:
        vehicles = list(list_data[modset][vehicle_type].keys())

        if (vehicles == {} or vehicles == []):
            continue

        for vehicle in vehicles:
            vehicle_classname = vehicle
            vehicle_name = list_data[modset][vehicle_type][vehicle_classname]["name"]
            vehicle_price = list_data[modset][vehicle_type][vehicle_classname]["price"]
            vehicle_condition = list_data[modset][vehicle_type][vehicle_classname]["condition"]

            arma_class = f'    ITEM({vehicle_classname}, {vehicle_price}, "{vehicle_type}", "{vehicle_condition}");'
            arma_classes.append(arma_class)
        
    arma_classes.append("};")
    return arma_classes

def convert_list_to_dict(list_data, list_categories):
    item_dictionary = {}

    for item in range(len(list_data)):
        modset = [element for element in list_data[item] if element == list_data[item][0]]

        for category in list_categories:
            if (category in modset or isinstance(modset, str)):
                modset.remove(category)

        if (modset != [] and (modset[0] not in list_categories)):
            item_dictionary.update({modset[0]: {}})

        for category in list_categories:
            if (modset != []):
                item_dictionary[modset[0]].update({category: {}})

    for item in list_data:

        modset = item[0]

        if (modset in list_categories):
            continue

        classname = item[1]
        name = item[2]
        price = item[3]
        category = item[4]

        condition = f"{CONDITION_COMMON_TRUE}"

        if (CONDITION_DEBUG == True):
            condition = "true"
        else:
            condition = match_category_macro(category=category[0])

        item_dictionary[modset][category[0]][classname] = ({"name": name, "price": price, "category": category[0], "condition": condition})

    return item_dictionary