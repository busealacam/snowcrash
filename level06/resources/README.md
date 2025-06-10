At the root repo, we have two files: one executable level06 and level06.php. 
These are their permissions:

> -rwsr-x---+ 1 flag06  level06 7503 Aug 30  2015 level06 

> -rwxr-x---  1 flag06  level06  356 Mar  5  2016 level06.php

When you run level06, it runs as the owner of the file (flag06), not as you. 
So level06 can be executed by users in *group level06* but only *as flag06* whereas level06.php can be executed by *anyone in group level06*, as themselves (eg. user level06).

The .php script contains:

`#!/usr/bin/php < ?php 
function y($m) {  
    $m = preg_replace("/\./", " x ", $m);  
    $m = preg_replace("/@/", " y", $m);  
    return $m;  
}  
function x($y, $z) {  
    $a = file_get_contents($y);  
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);  
    $a = preg_replace("/\[/", "(", $a);  
    $a = preg_replace("/\]/", ")", $a);  
    return $a;  
}  
$r = x($argv[1], $argv[2]);  
print $r;  
? >`  

x() takes two arguments, the first of which should be a file.
If the file doesn't exist, the script fails to open the stream.
It then uses preg_replace() to locate content within the file, and replace it.
It performs a regular expression search and replaces the content. 
`preg_replace($pattern, $replacement, $subject, $limit, $count)`
 
The first line: `$a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);` looks for any line beginning with `[x ` abd ending in `]`, with any content between the `x ` and closing `]`. If found, it replaces it with an execution of y(). The `/e` is a deprecated modifier that evaluates the replacement string as PHP code. So instead of just replacing the content as a literal string, PHP would run the string as code.

The () in the pattern parameter captures groups: Group 1 would be `[x ...]` and group 2 would be whatever comes after x. Group 1 = `(\[x (.*)\])` and group 2 = `(.*)`.

**The idea is to get the result of y() to execute getflag.** 

For the statement between the ("") to be executed as PHP code, we need to run it within a ${} scope. 
So, the input file should include: 

-v1 : ``[x ${`getflag>/tmp/res`}]``
-v2 : ``echo '[x ${`getflag`}]' > /tmp/test ``

so the output of getflag is saved in /tmp/res. 

