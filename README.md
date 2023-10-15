Personal Finance Tracker

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
```
