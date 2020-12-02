alexey@topos:~/cimat-tna/gp$ gp
Reading GPRC: /etc/gprc
GPRC Done.

                  GP/PARI CALCULATOR Version 2.13.0 (released)
          amd64 running linux (x86-64/GMP-6.2.1 kernel) 64-bit version
   compiled: Dec  2 2020, gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)
                            threading engine: single
                 (readline v8.1 enabled, extended help enabled)

                     Copyright (C) 2000-2020 The PARI Group

PARI/GP is free software, covered by the GNU General Public License, and comes 
WITHOUT ANY WARRANTY WHATSOEVER.

Type ? for help, \q to quit.
Type ?17 for how to get moral (and possibly technical) support.

parisize = 8000000, primelimit = 500000
? read("gassmann-pari.gp");

? f1 = x^8 - x^4 - 1;
? f2 = x^8 - 4*x^6 + 5*x^4 - 2*x^2 - 1;
? compare (f1,f2)
%4 = []
? K1 = nfinit(f1);
? K2 = nfinit(f2);
? nfisisom(K1,K2)
%7 = 0
? K1.disc
%8 = -40960000
? K2.disc
%9 = -40960000
? K1.sign
%10 = [2, 3]
? K2.sign
%11 = [2, 3]

? f1 = x^7 - 7*x - 3;
? f2 = x^7 - 7*x^4 - 21*x^3 + 21*x^2 + 42*x - 9;
? compare (f1,f2)
%14 = [3]
? K1 = nfinit(f1);
? K2 = nfinit(f2);
? nfisisom(K1,K2)
%17 = 0
? K1.disc
%18 = 4202539929
? K2.disc
%19 = 4202539929
? K1.sign
%20 = [3, 2]
? K2.sign
%21 = [3, 2]

? f1 = x^8 + 15;
? f2 = x^8 + 240;
? compare (f1,f2)
%24 = []
? K1 = bnfinit(f1);
? K2 = bnfinit(f2);
? nfisisom(K1,K2)
%27 = 0
? K1.disc
%28 = 174960000000
? K2.disc
%29 = 174960000000
? K1.sign
%30 = [0, 4]
? K2.sign
%31 = [0, 4]
? K1.no
%32 = 16
? K2.no
%33 = 8
? K1.reg
%34 = 66.316448148870962189601403176835356992
? K2.reg
%35 = 132.63289629774192437920280635367071398

? quit();
Goodbye!
