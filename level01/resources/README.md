Downloaded and ran Kali on a VM for access to John The Ripper

Noticed that under cat /etc/passwd, which shows the contents of the shadow password service,

the x column that usually shows the password is protected using shadow, 

instead had 42hDRfypTqqnw.

Ran the entire thing with John the ripper. 

echo flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash >> hash.txt john hash.txt -->

john --show hash.txt

revealed the password to flag01 was "abcdefg"

getflag

