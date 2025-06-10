Checked out where we were and who we were using: id, whoami, groups

Tried to find files owned by level00 using 

find / -user level00 2> /dev/null 

Redirecting errors to /dev/null so they didn't flood the terminal.Mostly /proc files.

But running the same command using user flag00 user returned two useful results: 

/usr/sbin/john 
/rofs/usr/sbin/john

These files had a string that didn't work on its own as the 

flag00 password: cdiiddwpgswtgt

But running any basic shift cipher on it using dcode.fr (caesar, shift, rot etc) revealed the 

password: nottoohardhere
