#!/usr/bin/env python3

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# imports: library
from typing import Generator


def license_notice() -> Generator:
    yield '% This file is part of "Probable Adventure".'
    yield '%'
    yield '% This Source Code Form is subject to the terms of the Mozilla Public'
    yield '% License, v. 2.0. If a copy of the MPL was not distributed with this'
    yield '% file, You can obtain one at http://mozilla.org/MPL/2.0/.'
    yield ''
