There are two files at the root of the repo:

-rwsr-s---+ 1 flag08 level08 8617 Mar 5 2016 level08 -rw------- 1 flag08 flag08 26 Mar 5 2016 token

Executing ./level08 without an argument results in an instructional output on how to use the executable instead: ./level08 [file to read]

Adding an argument, for example, token, shows an error message: You may not access 'token'

But adding any other file as an argument to ./level08 prints the contents of the file to the console.

A run through binary ninja indicates that the check for the token file is 

"if (strstr(argv[1], "token") != 0)",

then return "You may not access "token"".

So, creating a symbolic link towards that file with any name that doesn't include 'token' does the trick.

ln -vs /home/user/level08/token /tmp/test 
./level08 /tmp/test 

then returns the token.

That token can be used to login user flag08.

user flag08 has the permissions to run getflag.

