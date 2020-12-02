read("gassmann-pari.gp");

f1 = x^8 - x^4 - 1;
f2 = x^8 - 4*x^6 + 5*x^4 - 2*x^2 - 1;
compare (f1,f2)
K1 = nfinit(f1);
K2 = nfinit(f2);
nfisisom(K1,K2)
K1.disc
K2.disc
K1.sign
K2.sign

f1 = x^7 - 7*x - 3;
f2 = x^7 - 7*x^4 - 21*x^3 + 21*x^2 + 42*x - 9;
compare (f1,f2)
K1 = nfinit(f1);
K2 = nfinit(f2);
nfisisom(K1,K2)
K1.disc
K2.disc
K1.sign
K2.sign

f1 = x^8 + 15;
f2 = x^8 + 240;
compare (f1,f2)
K1 = bnfinit(f1);
K2 = bnfinit(f2);
nfisisom(K1,K2)
K1.disc
K2.disc
K1.sign
K2.sign
K1.no
K2.no
K1.reg
K2.reg

quit();
