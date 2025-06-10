There are two notable files at the root of the repo: 

-rwsr-sr-x 1 flag09 level09 7640 Mar 5 2016 level09 
----r--r-- 1 flag09 level09 26 Mar 5 2016 token

level09 takes an argument. Unlike the previous level, token is readable.

passing token to level09 outputs: tpmhr 

passing the contents of token to level09 with 

./level09 `cat token` 

outputs a longer, 26 byte string but with some non-printable characters. 

The cipher from the level09 script is a hint to what needs to be done to actually decipher token.

./level09 abcdef returns: acegik 
./level09 12345 returns: 13579

The algorithm adds 1 to every incrementation - first 0, then 1, then 2, then 3 etc. 
The index is added as incrementation to the ascii value.

Instead, you create a script that decrements the ascii value by its index.

cd /tmp
gcc rot.c -o rot
./rot $(cat ~/token)

That reveals the flag, password to flag09. Which then reveals the password to level10 with getflag.
