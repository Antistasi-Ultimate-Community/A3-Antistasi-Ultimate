#!/usr/bin/env python3

from ast import literal_eval
import argparse
import os
import re
import sys

class NoArgumentsException(Exception):
    def __init__(self, parser):
        print("At least one of (-d | --directory) or (-f | --filename) must be passed to this script\n")

class NoFilesSpecifiedException(NoArgumentsException):
    pass

class NoFilesToConvertException(Exception):
    def __init__(self, single_file):
        if single_file:
            print("The specified file is not a valid .sqf faction template file")
        else:
            print("The specified directory does not contain any valid .sqf faction template files")

class InvalidFileException(Exception):
    def __init__(self, filename):
        print("{0} is not a valid file".format(filename))

class InvalidDirectoryException(Exception):
    def __init__(self, directory):
        print("{0} is not a valid directory".format(directory))

def process_arguments():
    parser = argparse.ArgumentParser(
        prog = "python convert_template_tiered_vehicles.py",
        description = "Antistasi Ultimate - Template Converter (tiered vehicles)\n\nConverts legacy faction templates to new format required to support tier-specific vehicles",
        epilog = ""
    )
    parser.add_argument("-d", "--directory", help="attempt to convert all .sqf files in this directory")
    parser.add_argument("-f", "--filename", help="attempt to convert the specified file")
    parser.add_argument("-i", "--in-place", action="store_true", required=False, help="convert the file(s) in place without adding _converted suffix; .bak copies of the original files are created instead")
    parser.add_argument("-o", "--output", required=False, help="output the converted file(s) to this directory")
    parser.add_argument("-r", "--recursive", action="store_true", required=False, help="attempt to convert all .sqf files in this directory and all subdirectories; not currently implemented...")
    parser.add_argument("-v", "--verbose", action="store_true", required=False, help="print extra logging messages; not currently implemented...")
    parser.add_argument("-y", "--yes-overwrite", action="store_true", required=False, help="do not prompt to overwrite existing files")
    args = parser.parse_args()

    try:
        if len(sys.argv) == 1: raise NoArgumentsException(parser)
        if not (args.filename or args.directory): raise NoFilesSpecifiedException(parser)
        if args.filename and not os.path.isfile(args.filename): raise InvalidFileException(args.filename)
        if args.directory and not os.path.isdir(args.directory): raise InvalidDirectoryException(args.directory)
        if args.output and not os.path.isdir(args.output): raise InvalidDirectoryException(args.output)
    except (NoArgumentsException, NoFilesSpecifiedException):
        parser.print_help(sys.stderr)
        sys.exit()
    except (InvalidFileException, InvalidDirectoryException):
        sys.exit()

    return args

def get_templates(args):
    try:
        if args.filename:
            if "_converted" in args.filename: print("{0} has already been converted, skipping...".format(args.filename))
            templates = [args.filename]
        elif args.directory:
            files, templates = os.listdir(args.directory), []
            for file in files:
                if "_converted" in file:
                    print("{0} has already been converted, skipping...".format(file))
                    continue
                elif file.endswith(".sqf"): templates += [os.path.join(args.directory, file)]    
            if len(templates) == 0: raise NoFilesToConvertException(False)
        else: raise Exception("somehow we didn't get a filename or directory... curious")
    except NoFilesToConvertException:
        sys.exit()
    except Exception as e:
        print(e)
        sys.exit()

    return templates

def open_template(template : str, in_place : bool = False):
    try:
        with open(template, "r") as file:
            content = file.read()
    except PermissionError:
        print("Permission error: {0} cannot be read".format(template))
        sys.exit()

    if in_place:
        try:
            with open(template + ".bak", "w") as file:
                file.write(content)
        except PermissionError:
            print("Permission error: {0} cannot be written".format(template + ".bak"))
            sys.exit()

    return content

def convert_template(content : str):
    keys_general = "vehiclesDropPod|vehiclesSDV|vehiclesBasic|vehiclesLightUnarmed|vehiclesLightArmed|vehiclesTruck|vehiclesTrucks|vehiclesCargoTrucks|vehiclesAmmoTrucks|vehiclesRepairTrucks|vehiclesFuelTrucks|vehiclesMedical|vehiclesLightAPCs|vehiclesAPCs|vehiclesIFVs|vehiclesTanks|vehiclesAA|vehiclesAirborne|vehiclesLightTanks|vehiclesBoat|vehiclesTransportBoats|vehiclesGunBoats|vehiclesAmphibious|vehiclesPlane|vehiclesCivPlane|vehiclesPlanesCAS|vehiclesPlanesAA|vehiclesPlanesTransport|vehiclesPlanesLargeCAS|vehiclesPlanesLargeAA|vehiclesPlanesGunship|vehiclesHelisLight|vehiclesHelisTransport|vehiclesHelisLightAttack|vehiclesHelisAttack|vehiclesAirPatrol|vehiclesArtillery|uavsAttack|uavsPortable|vehiclesPolice|staticMGs|staticAT|staticAA|staticMortars|staticHowitzers|vehicleRadar|vehicleSam|vehicleSam|minefieldAT|minefieldAPERS|howitzerMagazineHE|mortarMagazineHE|mortarMagazineSmoke|mortarMagazineFlare|vehiclesAT|vehiclesCivCar|vehiclesCivTruck|vehiclesCivHeli|vehiclesCivBoat|vehiclesCivIndustrial|vehiclesCivRepair|vehiclesCivMedical|vehiclesCivFuel|vehiclesCivSupply|staticMortarMagHE|staticMortarMagSmoke|staticMortarMagFlare|minesAT|mineAT|minesAPERS|mineAPERS|staticLowWeapons"
    keys_militia = "LightArmed|Trucks|Cars|APCs"
    keys_militia_full = "vehiclesLightArmed|vehiclesLightUnarmed|vehiclesTrucks|vehiclesCars|vehiclesAPCs"
    keys_rivals = keys_militia + "|Tanks|Helis|Uavs"

    # first replace all the general vehicles
    pattern_string = r'\[("({0})"), (.+?)\] call _fnc_saveToTemplate;'.format(keys_general)
    content = re.sub(pattern_string, r'_vehiclesData set [\1, \3];', content, flags=re.DOTALL)

    # add specific translation of vehiclesMilitiaXXX for militiaVehiclesData
    pattern_string = r'\[("vehiclesMilitia({0})"), (.+?)\] call _fnc_saveToTemplate;'.format(keys_militia)
    content = re.sub(pattern_string, r'_militiaVehiclesData set ["vehicles\2", \3];', content, flags=re.DOTALL)

    # add specific translation of vehiclesRivalsXXX for vehiclesData
    pattern_string = r'\[("vehiclesRivals({0})"), (.+?)\] call _fnc_saveToTemplate;'.format(keys_rivals)
    content = re.sub(pattern_string, r'_vehiclesData set ["vehicles\2", \3];', content, flags=re.DOTALL)

    content = re.sub(r'vehiclesCars', r'vehiclesLightUnarmed', content)
    
    # finally, add the initial hashmap definitions and function calls
    # here be dirty hacks and probably poor form python

    # Common vehicles
    pattern_general = r'_vehiclesData set \[("({0})"),\s*(.+?)\];'.format(keys_general)
    matches_general = re.finditer(pattern_general, content, flags=re.DOTALL)
    first_match_general, last_match_general, modified = len(content), 0, False
    for match in matches_general:
        first_match_general = min(first_match_general, match.start())
        last_match_general = max(last_match_general, match.end())
        modified = True
    
    base_hashmap = "private _vehiclesData = call _fnc_createLoadoutData;\n\n"
    if modified:
        content = content[:first_match_general] + base_hashmap + content[first_match_general:]
    else:
        return content
    
    # militia vehicles
    pattern_militia = r'_militiaVehiclesData set \[("({0})"), (.+?)\];'.format(keys_militia_full)
    matches_militia = re.finditer(pattern_militia, content, flags=re.DOTALL)
    first_match_militia, last_match_militia, militia_vehicles = len(content), 0, ""
    for match in matches_militia:
        first_match_militia = min(first_match_militia, match.start())
        last_match_militia = max(last_match_militia, match.end())
        militia_vehicles += ("\n" + match.group())
    
    #if re.findall(r'_(reb|civ|riv)_', os.path.basename(template).lower()):
    tier_hashmaps = ""
    if militia_vehicles == "": # Reb/Civ/Riv template
        tier_hashmaps = "\n".join([
            '\n',
            '["vehiclesData", [',
            '    _vehiclesData',
            ']] call _fnc_saveVehiclesToTemplate;\n'
        ])
    else:
        content = content[:first_match_militia] + content[last_match_militia:]
        last_match_general -= (last_match_militia - first_match_militia)
        tier_hashmaps = "\n".join([
            '\n',
            'private _eliteVehiclesData = _vehiclesData call _fnc_copyLoadoutData;',
            'private _militaryVehiclesData = _vehiclesData call _fnc_copyLoadoutData;',
            'private _militiaVehiclesData = _vehiclesData call _fnc_copyLoadoutData;\n'
        ]) + militia_vehicles + "\n".join([
            '\n',
            '["vehiclesData", [',
            '    _militiaVehiclesData,',
            '    _militaryVehiclesData,',
            '    _eliteVehiclesData',
            ']] call _fnc_saveVehiclesToTemplate;\n'
        ])
    
    last_match_general += len(base_hashmap)
    content = content[:last_match_general] + tier_hashmaps + content[last_match_general:]

    return content

def write_template(template : str, content: str, directory : str, in_place : bool = False, yes_overwrite : bool = False):
    output_dir_default = os.path.split(template)[0]
    output_dir = directory or output_dir_default
    base_file = os.path.split(template)[1].split(".")[0]

    try:
        if not os.path.isdir(output_dir):
            raise InvalidDirectoryException(output_dir)
    except InvalidDirectoryException:
        #print("Setting output directory to {0}".format(output_dir_default))
        #output_dir = output_dir_default
        sys.exit()
    finally:
        if in_place: 
            final_name = template
        else:
            final_name = "".join([output_dir, os.path.sep, base_file, "_converted.sqf"])
    
    if os.path.isfile(final_name) and not yes_overwrite:
        response = ""
        while not response.lower() in ["y", "yes", "n", "no"]:
            response = input("File {0} exists. Overwrite? [(Y|yes)|(N|no)]: ".format(template))
        if not response in ["y", "yes"]: return False

    try:
        with open(final_name, "w") as file:
            file.write(content)
    except PermissionError:
        print("Permission error: {0} cannot be written".format(template))
        sys.exit()

    return True
    
if __name__ == "__main__":
    args = process_arguments()
    templates = get_templates(args)
    #print(templates)

    for template in templates:
        content = open_template(template, in_place=args.in_place)
        content = convert_template(content)
        write_template(template, content, args.output, in_place=args.in_place, yes_overwrite=args.yes_overwrite)
