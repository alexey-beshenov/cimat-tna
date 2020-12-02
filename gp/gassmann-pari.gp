dectype (f,p) = {
  local (dec = factor(f*Mod(1,p)));
  vecsort (vector (matsize(dec)[1], i, poldegree(dec[i,1])))
};

N = 10^6;

compare (f1,f2) = {
  local (badprimes = List());

  forprime (p=2,N,
    if (dectype(f1,p) != dectype(f2,p),
      listput (badprimes,p)
    )
  );

  Vec(badprimes)
};
