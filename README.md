# Personal Finance Tracker

---

A framework for tracking transactions

## Usage

```sh
# Save a transaction
mkdir -p tx/25XMR/nft/"sold pixelart"
```
Where

- `25` is the amount. It can be negative for expenses.
- `XMR` is the currency. Maybe omitted for a default.
- `nft` is the transaction category 
- `sold pixelart` is the description of the transaction. 
    If this is a recurring transaction, $RANDOM can be used for each instance of transaction .e.g. 
    ```sh
    mkdir -p tx/12PHP/fare/$RANDOM
    ```

    Note: It's okay to use $RANDOM because this framework depends on the datetime metadata of the directory.
    Therefore, moving the files to a file system that doesn't support or modifies the datetime metadata is
    dangerous.

To view all transactions:

```sh
$ find tx -type d -empty -exec stat --format="%y %n" {} \;
```

Get the total of the transactions:

```
find tx -type d -empty -exec stat --format="%y %n" {} \; | awk '{print $4}' | awk -F '/' '{ print $2}' | awk '{ gsub(/[^0-9.-]/, ""); sum += $1 } END { print sum }'
```

Scripts are also available:

```
# pretty printed transactions:
$ show/tx.sh
0   date        time   currency  type  amount    category
1   2023-10-15  22:47  PHP       +     13        fare
2   2023-10-15  16:44  PHP       -     13        fare
3   2023-10-15  16:39  PHP       +     13000.05  salary
4   2023-10-15  14:59  PHP       -     18        fare
5   2023-10-15  14:56  PHP       -     13        fare
6   2023-10-15  14:56  PHP       -     13        fare
7   2023-10-15  14:43  PHP       -     18        fare
8   2023-10-15  14:43  PHP       -     18        fare
9   2023-10-15  14:43  PHP       -     18        fare
10  2023-10-15  14:38  PHP       -     18        fare
11  2023-10-15  13:42  PHP       +     25        payment16139
```

## Why? 

I tried different ways of tracking expenses but it always fails because 
entering every transaction is a hassle. 

My goal is to create the easiest way to enter transactions for those
who live in the terminal.
