all_entries=$(find tx -type d -empty -exec stat --format="%y %n" {} \;)
# all_entries will have the string:
# 2023-10-15 14:43:22.853190549 +0800 tx/-18PHP/fare/13766 home to town
# 2023-10-15 14:43:04.981069469 +0800 tx/-18PHP/fare/26765
# 2023-10-15 14:59:29.059628490 +0800 tx/-18PHP/fare/24007 town to home
# 2023-10-15 14:38:44.579320316 +0800 tx/-18PHP/fare/26522
# 2023-10-15 14:56:14.646349096 +0800 tx/-13PHP/fare/14:56:14
# 2023-10-15 14:56:42.582533401 +0800 tx/-13PHP/fare/2023-10-15
# 2023-10-15 13:42:23.272353225 +0800 tx/25PHP/payment16139

# printf "Total \n$all_entries\n"
b=$( printf $all_entries | awk '{ print $1}')
printf "Total Expenses:$b"
