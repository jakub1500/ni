#!/bin/python

import sys

DEBUG = 1
ARGS_PREDICTED_LEN = 2 # file name + file to read

def print_debug(debug_info):
    if DEBUG == 1:
        print(debug_info)

def check_args(arg_list):
    if type(arg_list) is not list:
        print("kill yourself")
        print_debug("input args is not alist")
    if len(arg_list) != ARGS_PREDICTED_LEN:
        print("Give proper number b!tch")
        exit(1)

def get_base(raw_string):
    if raw_string.startswith("0x"):
        return 16
    elif raw_string.startswith("0b"):
        return 2
    else:
        return 10

def cast_to_int(raw_value):
    try:
        return int(raw_value, get_base(raw_value))
    except ValueError:
        print("Given number is not proper")
        exit(1)

def info_hex(value):
    return "* {} <-- hex\n".format(hex(value))

def info_dec(value):
    return "* {} <-- dec\n".format(value)

def info_bin(value):
    return "* {} <-- bin\n".format(bin(value))

def info_bitset(value):
    bits = len(bin(value)) -2
    val_as_str = bin(value)[2:]
    bit_set_str = "* bit set [ "
    for i in range(bits):
        if val_as_str[i] == "1":
            bit_set_str += "{} ".format(bits-1-i)
    bit_set_str += "]"

    return bit_set_str

def print_info(fnc_list, value):
    for fnc in fnc_list:
        print(fnc(value))


check_args(sys.argv)

value = cast_to_int(sys.argv[1])
supported_fnc = [info_hex, info_dec, info_bin, info_bitset]

print_info(supported_fnc, value)





