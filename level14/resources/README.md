There is NOTHING.

We explode /bin/getflag with gdb directly, to try and set UID to 3014 because
the UID of user flag14 is 3014.

We can do this with GDB.

`gdb /bin/getflag`
we disassemble main `disas main`

we see that there is a system call to `ptrace`
which checks whether getflag is run as a child process. 

This is the case with GDB, where gdb is a parent. 
We need to bypass ptrace. 

We can run:
`catch syscall ptrace`
which creates a catchpoint (catchpoint 1). 

We can run `commands 1`
>set $eax=0
>continue
>end

Then we see a call to `getuid`
we set breakpoints right after the call.
`b *0x08048b02` 

and set a command that runs at that breakpoint:
`commands 2`
> set $eax=3014
> continue
> end

run

that sets the UID to 3014 and generates the token. 

