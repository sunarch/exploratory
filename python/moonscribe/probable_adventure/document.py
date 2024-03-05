#!/usr/bin/env python3

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# imports: library
from typing import Generator

# imports: subproject
from moonscribe.probable_adventure import common


def document() -> Generator:
    chapters: int = 0

    for line in common.license_notice():
        yield line
    yield '\\documentclass[12pt,a4paper]{book}'
    yield ''
    yield '\\usepackage[utf8]{inputenc}'
    yield '\\usepackage[T1]{fontenc}'
    yield ''
    yield '\\usepackage{import}'
    yield '\\usepackage{graphicx}'
    yield '\\usepackage[left=2.50cm, right=2.50cm, top=2.50cm, bottom=2.50cm]{geometry}'
    yield '\\usepackage[english]{babel}'
    yield ''
    yield '\\author{András Németh}'
    yield '\\title{Probable Adventure}'
    yield ''
    yield '\\begin{document}'
    yield ''
    yield '\\frontmatter'
    yield '\\maketitle'
    yield ''
    yield '\\tableofcontents'
    yield ''
    yield '\\mainmatter'
    yield ''
    yield '\\subimport{./}{chapter-sample.tex}'
    for i in range(chapters):
        yield '\\subimport{./generated/}{chapter-' + f'{i:0>2}' + '.tex}'
    yield ''
    yield '\\end{document}'
    yield ''
