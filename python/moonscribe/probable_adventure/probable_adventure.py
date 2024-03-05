#!/usr/bin/env python3

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# imports: library
import argparse


def main():
    parser = argparse.ArgumentParser(prog='probable-adventure')
    parser.add_argument('-m', '--mode',
                        help='check mode')
    args = parser.parse_args()

    if args.mode == "a":
        print("a.")


if __name__ == '__main__':
    main()
