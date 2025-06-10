At /home/user/level02, there's a file named level02.pcap. 

.pcap files store packet captures, typically packets of data shared over a network.

Wireshark is a common packet analyzer, pre-installed on Kali, that allows you to examine such files.

By right-clicking on one of the data exchanges and clicking Follow > TCP stream,

you can see the exchange of data in several formats including ASCII.

Here the password seems to be ft_wandr...NDRel.L0L.

But an examination of the hexadecimal format shows that the .'s correspond to 7F, or DEL on the ascii table.

Therefore the actual password to flag02 is "ft_waNDReL0L".

