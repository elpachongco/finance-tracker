#!/bin/awk -f

BEGIN { 
  printf "%3d %10s %5s %3s %s %-8s %s \n", "0", "date", "time", "currency", "type", "amount", "category"
}

{ 
  date = $1 
  time = $2 
  path = $4
  split(path, path_split, "/");

  category = path_split[3]
  description = path_split[4]

  amount_string = path_split[2]

  amount = path_split[2]
  gsub(/[,A-Za-z+\-]/, "", amount)


  currency = path_split[2]
  gsub(/[+\-0-9a-z,.]/, "", currency)

  sign = path_split[2]
  gsub(/[0-9a-zA-Z,\.]/, "", sign)
  if (sign == "") 
    sign = "+"

  printf "%3d ", NR
  printf "%3s %.5s %s %s %s %s \n", date, time, currency, sign, amount, category
} 

END { }
