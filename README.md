resolvchange

Source code to recent linux purebasic x64 resolvement of DNS problems when linux breaks /etc/resolv.conf

This is to be used when you are using resolvconf (can't remember the name, it was buggy)
or openresolv to retrieve the vpn server's DNS and add it to /etc/resolv.conf

To use: start resolvchange (./resolvchange or build exe different name) 

1. sudo su
2. enter system password
3. goto where the compiled linux programs are stored.
4. Start VPN
5. immediately start resolvchange after. 
for example:
6. ./resolvchange or ./compiledprogramfilenameofresolvchange

googlednsinstall just installs google public dns while your vpn is down (or maybe even still up)

To get VPN started where linux broke /etc/resolv.conf
compile googlednsinstall.pb to a filename and execute it with 
./googlednsinstall or ./compiledgooglednsinstallprogramfilename
start VPN
immediately start resolvchange after. 
(./resolvchange or ./compiledresolvchangeprogramfilename)

Cheers with Beers!
