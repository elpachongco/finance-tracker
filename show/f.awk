#!/bin/awk -f

BEGIN { 
  print "0", "date", "time", "currency", "type", "amount", "category", "description"
}

{ 
  date = $1 
  time = $2 
  path = $4

  # Split the path by slashes
  split(path, path_split, "/");

  # Find the index of `tx`
  for (i = 0; i < length(path_split); i++) 
    if (path_split[i] == "tx")
      tx_index = i
   

  # Find these variables relative to `tx` index
  category = path_split[2+tx_index]
  description = path_split[3+tx_index]

  amount_string = path_split[1+tx_index]

  amount = path_split[1+tx_index]
  gsub(/[,A-Za-z+\-]/, "", amount)

  currency = path_split[1+tx_index]
  gsub(/[+\-0-9a-z,.]/, "", currency)

  sign = path_split[1+tx_index]
  gsub(/[0-9a-zA-Z,\.]/, "", sign)
  if (sign == "") 
    sign = "+"

  # print sign
  # Assign color to numbers
  if (sign == "+")
    amount = "\033[32m" amount "\033[0m";
  else
    amount = "\033[31m" amount "\033[0m";

  # Description comes after 3 paths from `tx`. 
  # all the succeeding columns are also description.
  # description = "\""
  description = path_split[tx_index+3]
  for (i=0+tx_index+3; i <= NF; i++) {
    description = description "·" $i
  }

  # If description contains quotes only, delete
  description = description "\""
  if (length(description) > 0 ) description = "\"" description;
  if (description == "\"\"") description = "";

  printf "%3d ", NR
  printf "%3s", date
  printf " %.5s", time
  printf " %s", currency
  printf " %s", sign
  printf " %s", amount
  printf " %s", category
  printf " %10s\n", description
} 

END { }
