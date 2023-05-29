#!/bin/bash
asciidoc -b docbook _README.adoc

pandoc -f docbook -t gfm _README.xml -o README.md
