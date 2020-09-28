/* ----------------------------------------------------------------------
   Decomposition type for N rational primes in K/Q,
   excluding ramified primes.

   Flag only_f: output only the residue degree of the first prime
                ideal (makes sense if K/Q is Galois).

   Output is written to file.
---------------------------------------------------------------------- */

decomp_stat (K,file,title,N,{only_f=0}) = {
  local (i=0, p=1, dec, dec_types = List([]), dec_list = Map());

  while (i < N,
    p = nextprime (p+1);
    if (K.disc % p == 0, next());    /* skip ramified primes */

    dec = idealprimedec(K,p);
    dec = if (only_f,
      dec[1].f,
      vector (#dec,i,dec[i].f)
    );

    mapput (~dec_list, p, dec);

    local (j = setsearch(dec_types,dec,1));
    if (j != 0, listput(~dec_types, dec, j));

    i = i+1;
  );

  listsort (~dec_types);

  write (file, "# Field: ", title);

  write1 (file, "# Decomposition types: ");
  for (i=1,#dec_types,
    write1 (file, dec_types[i]);
    write1 (file, if (i!=#dec_types, "; ", "\n\n"));
  );

  p = 1; i=0;

  while (i < N,
    p = nextprime (p+1);
    if (K.disc % p == 0, next());    /* skip ramified primes */

    write (file, p, "\t", mapget(dec_list, p));

    i = i+1;
  );
};


/* ----------------------------------------------------------------------
   Generate some data
---------------------------------------------------------------------- */

number_of_primes = 1500;

fields = Map();

mapput(~fields, "Q(i)", [x^2+1,"x2+1.dat",0]);
mapput(~fields, "Q(zeta_{13})", [polcyclo(13),"cyclo-13.dat",1]);
mapput(~fields, "Q(zeta_{61})", [polcyclo(61),"cyclo-61.dat",1]);
mapput(~fields, "Q(2^{1/3})", [x^3 - 2,"x3-2.dat",0]);
mapput(~fields, "Q(2^{1/3}, zeta_3)", [x^6 - 3*x^5 + 5*x^3 - 3*x + 1,"S3.dat",0]);
mapput(~fields, "Q(2^{1/4}, i)", [x^8 - 4*x^6 + 8*x^4 - 4*x^2 + 1,"D8.dat",0]);
mapput(~fields, "x^4 - x + 1", [x^4 - x + 1,"S4.dat",0]);
mapput(~fields, "x^5 - x + 1", [x^5 - x + 1,"S5.dat",0]);

keys = Vec(fields);
{ for (i=1,#keys,
  printf ("* %s\n", keys[i]);
  local ([pol,file,f] = mapget(fields,keys[i]));
  decomp_stat (nfinit(pol),file,keys[i],number_of_primes,f);
)};

quit;
