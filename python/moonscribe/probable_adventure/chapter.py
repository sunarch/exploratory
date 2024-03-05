# !/usr/bin/env python3

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# imports: library
from typing import Generator

# imports: subproject
from moonscribe.probable_adventure import common


def chapter(title: str) -> Generator:
    for line in common.license_notice():
        yield line
    yield '\\chapter{' + title + '}'
    yield 'Text'
    yield ''
