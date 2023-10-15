#!/bin/sh
# Show all transactions
find tx -type d -empty -exec stat --format="%y %n" {} \; | sort -k 1,2 -r | ./show/f.awk | column -t
# TODO: Add sorting (separate column and values)
