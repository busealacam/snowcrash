There is an executable `level13` at the root. 
Its permissions are: 
-rwsr-sr-x 1 flag13 level13 7303 Aug 30  2015 level13

Running it results in:
`UID 2013 started us but we we expect 4242`

Running `id` shows:
`uid=2013(level13) gid=2013(level13) groups=2013(level13),100(users)`

Therefore that a check is done on uid, and we need to change it to 4242.

We can do this with GDB.

`gdb level13`
we disassemble main `disas main`
we see two calls to `getuid`
we set breakpoints right after the first call.
`b *0x0804859a` 

and set a command that runs at that breakpoint:
`commands 1`
> set $eax=4242
> continue
> end

run

that sets the UID to 4242 and generates the token. 

