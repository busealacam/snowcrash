level10 is an executable that takes two arguments: file and host.

executing 

./level10 /tmp/existingfile 127.0.0.1 

shows it attempts to send over port 6969

If you open a connection using netcat, with 

nc -l 6969 

and try the same command again, you can send over the file.

Sending over token is impossible because token is only readable by flag10. 

But a look at the binary ninja analysis shows that access is only checked once at the beginning of the script, and only checks RealUID. 
running 

time ./level10 /tmp/existingfile 127.0.0.1 

shows the runtime is around 0.001 - 0.002s.

So, using scripts, you can create a tmp file with the right permissions, and if you get the timing right, have access return 0 on that file. 
Then create a sym link between that file and token before the file is read. 

Add a 

sleep 0.001s 

between the creation of the file and the symlink so the file exists with the right permissions for 0.001 secs.

Give all your scripts `chmod 755` permissions. 
