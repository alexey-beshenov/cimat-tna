/* ----------------------------------------------------------------------
  Tabla de factorizaciónes p O_K
---------------------------------------------------------------------- */

primedec_tbl (f,rows,cols,{m=0}) = {
  local (K = nfinit (f));
  local (ps = primes (rows*cols));

  printf ("\\begin{center}\n");
  printf ("\\renewcommand{\\arraystretch}{1.5}\n");
  printf ("\\begin{tabular}{");
    for (i=1, cols,
      for (j=1, 3 + (m!=0),
        printf ("x{1.25cm}")
      )
    );
  printf ("}\n");

  for (i=1, cols,
    printf ("$p$ & $p\\O_K$ & $f$ ");
    if (m != 0,
      printf ("& $p~(%d)$ ", m);
    );

    if (i != cols,
      printf ("& "),
      printf ("\\tabularnewline\n\\hline\n")
    )
  );

  for (r=1, rows,
    for (c=0, cols-1,
      local (p = ps[r + rows*c]);
      local (dec = idealprimedec (K,p));

      printf ("$%d$ & ", p);

      printf ("$");
      for (i=1, #dec,
        printf ("\\mathfrak{p}");
	if (#dec > 1, printf ("_%d", i));;
	if (dec[i].e > 1, printf ("^%d", dec[i].e));
	if (i != #dec, printf ("\\,"))
      );
      printf ("$ & ");

      printf ("$");
      if (#dec > 1, printf ("("));
      for (i=1, #dec,
        printf ("%d", dec[i].f);
	if (i != #dec, printf (","))
      );
      if (#dec > 1, printf (")"));
      printf ("$");

      if (m != 0,
        printf (" & $%d$", p%m)
      );

      if (c != cols-1,
        printf (" & "),
	printf (" \\tabularnewline\n\\hline\n")
      )
    )
  );

  printf ("\\end{tabular}\n");
  printf ("\\end{center}\n")
};
