/* El campo Q (2^⁽1/3), \zeta_3 */
K = nfinit (x^6 - 3*x^5 + 5*x^3 - 3*x + 1);

stat = [0,0,0];

p = 5;

/* Estadística de descomposiciones */
{for (i=1, 10^5,
  dec = idealprimedec(K,p);
  fs = vector (#dec, i, dec[i].f);

  if (fs == [1,1,1,1,1,1], stat[1] = stat[1] + 1,
      fs == [2,2,2],       stat[2] = stat[2] + 1,
      fs == [3,3],         stat[3] = stat[3] + 1);

  if (i == 10 || i == 10^2 || i == 10^3 || i == 10^4 || i == 10^5,
    freqs = 1.0/i*stat;
    printf ("%d:\t%.04f  %.04f  %.04f\n", i, freqs[1], freqs[2], freqs[3])
  );

  p = nextprime (p+1)
)};
