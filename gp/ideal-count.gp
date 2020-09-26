graph_ideal_count (f,N) = {
  local (L,s);

  L = ideallist (nfinit(f),N);
  s = 0;

  for (i=1,#L,
    s = s + #L[i];
    printf ("\\draw[line width=2pt, blue] (%d,0) -- (%d,%d);\n", i, i, s)
  )
};
