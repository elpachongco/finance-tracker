#!/bin/sh

# Show all transactions
 

script_dir=$(dirname $0)
tx_dir=$(dirname $script_dir)

find $tx_dir/tx -type d -empty -exec stat --format="%y %n" {} \; | sort -k 1,2 -r | $script_dir/f.awk | column -t
# TODO: Add sorting (separate column and values)
