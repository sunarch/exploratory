#!/usr/bin/env python3
# -*- coding: utf-8, vim: expandtab:ts=4 -*-

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

ASCII: dict = {
    0: 'NUL',
    1: 'SOH', 2: 'STX',
    3: 'ETX', 4: 'EOT',
    5: 'ENQ',
    6: 'ACK',
    7: 'BEL',
    8: 'BS',
    9: 'TAB',
    10: 'LF',
    11: 'VT',
    12: 'FF',
    13: 'CR',
    14: 'SO', 15: 'SI',
    16: 'DLE',
    17: 'DC1', 18: 'DC2', 19: 'DC3', 20: 'DC4',
    21: 'NAK',
    22: 'SYN',
    23: 'ETB',
    24: 'CAN',
    25: 'EM',
    26: 'SUB',
    27: 'ESC',
    28: 'FS', 29: 'GS', 30: 'RS', 31: 'US',
    127: 'DEL'
}


def int_to_bin_str(char_ord: int) -> str:
    """int to binary string representation"""

    if 0b00000000 <= char_ord <= 0b11111111:
        return f'{char_ord:0>8b}'

    return '~~~~~~~~'


def int_to_oct_str(char_ord: int) -> str:
    """int to octal string representation"""

    if 0o000 <= char_ord <= 0o777:
        return f'{char_ord:0>3o}'

    return '~~~'


def int_to_dec_str(char_ord: int) -> str:
    """int to decimal string representation"""

    if -99 <= char_ord <= 999:
        return f'{char_ord:>3}'

    return '~~~'


def int_to_hex_str(char_ord: int) -> str:
    """int to hexadecimal string representation"""

    if 0x00 <= char_ord <= 0xFF:
        return f' {char_ord:0>2X}'

    if 0x100 <= char_ord <= 0xFFF:
        return f'{char_ord:0>3X}'

    return '~~~'


def int_to_chr_str(char_ord: int) -> str:
    """int to character string representation"""

    if 32 <= char_ord <= 126:
        return f'\'{chr(char_ord)}\''
    elif 0 <= char_ord <= 127:
        return f'{ASCII[char_ord]:>3}'
    else:
        return '::: NON-ASCII :::'


def display_ascii(char_ord: int) -> str:

    # headers
    if char_ord is None:
        return '     BIN | OCT | DEC | HEX | CHR\n' + \
               '-------- | --- | --- | --- | ---'

    return ' | '.join((
        int_to_bin_str(char_ord),
        int_to_oct_str(char_ord),
        int_to_dec_str(char_ord),
        int_to_hex_str(char_ord),
        int_to_chr_str(char_ord)
   ))


def convert_message(message: list[int]) -> str:

    def convert_unit(unit: int) -> str:
        unit = int_to_chr_str(unit)
        if '\'' not in unit and unit.strip() in ASCII.values():
            return '(ASCII-CONTROL)'
        return unit

    return ''.join(list(map(convert_unit, message)))\
           .replace('\'', '')\
           .replace('(ASCII-CONTROL)', '⌺')\
           .replace('::: NON-ASCII :::', '⍰')


def convert_input(line: str) -> int:
    line = line.strip()
    
    match line[0:2]:
        case '0b':
            return int(line, 2)
        case '0o':
            return int(line, 8)
        case '0x':
            return int(line, 16)
        case _:
            return int(line)


def main() -> None:
    print('')

    with open('message.txt', 'r', encoding='UTF-8') as fh_input:
        message = list(map(convert_input, fh_input.readlines()))

    # details table
    print(display_ascii(None))
    for char_ord in message:
        print(display_ascii(char_ord))
    print('')

    # assembled message
    print('↓↓↓')
    print(convert_message(message))
    print('')


if __name__ == '__main__':
    main()

