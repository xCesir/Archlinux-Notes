[Reddit Post](https://askubuntu.com/questions/1319688/luks-how-can-i-add-more-password-slots-or-remove-change-a-password)

I assume that the partition is ````/dev/sda3````

If you don't know the name you can list all partitions with ````lsblk -f````.

**Add a new password slot:**

````sudo cryptsetup luksAddKey /dev/sda3````
 - The next free password slot will be used
 - First it will ask for a existing valid password, after that you have to input the new password.
 - The old password will stay valid, as well.
   
If you want to add a keyfile (instead of a password) it would be

````sudo cryptsetup luksAddKey /dev/sda3 MyKeyFile.txt````

**Remove a password slot:** 

 - Possibility 1: sudo cryptsetup luksRemoveKey /dev/sda3
   => You have to enter the password which you want to delete (it will automatically find the correct password slot)
 
 - Possibility 2: sudo cryptsetup luksKillSlot /dev/sda3 2
=> This will delete password slot 2 (you have to enter the password of any other password slot, but not of slot 2
=> This works even if you don't know the password of slot 2

- Possibility 3: sudo cryptsetup luksRemoveKey --key-file MyKeyFile.txt /dev/sda3
=> Removes the key file MyKeyFile.txt if it is valid

**See how many slots are active:**

````sudo cryptsetup luksDump /dev/sda3````

This will output all settings of luks for this partition.

**Test if a password is valid for the partition:**

````sudo cryptsetup open --verbose --test-passphrase /dev/sda3````

Now you can enter a password and it will tell you if it was wrong or to which password slot it belongs.
If you want to test if a KeyFile is valid it works like this:
````sudo cryptsetup open --verbose --test-passphrase --key-file MyKeyFile.txt /dev/sda3````

**Backup the header of a luks partition:**

````sudo cryptsetup luksHeaderBackup /dev/sda3 --header-backup-file MyLuksHeader.dat````

````sudo chmod +r MyLuksHeader.dat````

It will create a file of 16MB.
This is very important to save. If the header is damaged all data is lost without a backup!

**List all encrypted file systems:**

````sudo cat /etc/crypttab````

If you need more help you can type ````man cryptsetup````.
