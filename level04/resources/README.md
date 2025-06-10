At the root of the repo is a file name level04.pl. 
Files like these are executed by the perl interpreter (specified by the first line of the code): #!/usr/bin/perl 

The second line is a comment, and indicates the port it's running on: # localhost:4747. netstat -tuln shows port 4747 is open.

Curl is on the snowcrash VM, so we can even connect to the port directly and check the response using

curl -I http://localhost:4747

Next is a function x which takes a parameter. That parameter is assigned to y.

sub x { $y = $_[0]; print echo $y 2>&1; } it prints the result of the echo $y command, 

but since it is in backticks, which expand the variables within, it represents an injection vulnerability.

you can therefore pass a command to 'x' and have it execute. In our case, that's getflag.

Typical formats don't work (backticks, $() etc. because it has to be URL-compatible)

So the command is 

curl http://localhost:4747/level04.pl?x=%60getflag%60 
curl 'localhost:4747?x=$(getflag)'
curl 'localhost:4747?x=`getflag`'


