At the root of the repo, there is a .lua script that starts a server, listening on 127.0.0.1:5151.

connecting to that port with nc 127.0.0.1 5151, you are prompted for a password, which is the logic followed in the lua script.

The most prominent injection opportunity is in `pass`, since there doesn't seem to be any checks for special bash characters in the hash() function. 

So simply passing `getflag > /tmp/flag` as a password creates the /tmp/flag file with the flag in it. 
The redirection is important, otherwise it is passed as input to sha1sum instead. 

