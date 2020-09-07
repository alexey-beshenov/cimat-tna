/* ----------------------------------------------------------------------
  Tablas de grupos de clase para el apéndice
---------------------------------------------------------------------- */

fingp_tex (g) = {
  if (#g == 0, return ("0"));

  local (str);

  str = concat ("\\ZZ/",g[1]);

  for (i=2, #g,
    str = concat (str, concat ("\\oplus\\ZZ/",g[i]))
  );

  str
};


/* ----------------------------------------------------------------------
  Campos cuadráticos
---------------------------------------------------------------------- */

list_clgp_quadr (d0,rows,cols, im) = {
  local (N = rows*cols);

  local (sqf = vector(N));
  local (i=1, d=d0);

  while (i <= N,
    while (!issquarefree(d),
      d = d + if (im,-1,+1)
    );
    sqf[i] = d;
    d = d + if (im,-1,+1);
    i = i+1;
  );

  for (r=1, rows,
    for (c=0, cols-1,
      d = sqf[r + rows*c];

      K = bnfinit (x^2 - d);

      printf ("$\\QQ (\\sqrt{%d})$ & $%s$ ", d, fingp_tex(K.clgp[2]));

      if (c != cols - 1, printf ("& "))
    );

    printf ("\\tabularnewline\\hline\n")
  )
};


/* ----------------------------------------------------------------------
  Campos ciclotómicos
---------------------------------------------------------------------- */

list_clgp_cycl (rows,cols) = {
  local (N = rows*cols);

  local (ns = vector(N));
  local (i=1, n=3);

  while (i <= N,
    while (n%4 == 2, n = n + 1);
    ns[i] = n;
    n = n + 1;
    i = i+1;
  );

  for (r=1, rows,
    for (c=0, cols-1,
      n = ns[r + rows*c];

      K = bnfinit (polcyclo(n));

      printf ("$\\QQ (\\zeta_");
      if (n < 10,
        printf ("%d", n),
	printf ("{%d}", n)
      );
      printf (")$ & $%s$ ", fingp_tex(K.clgp[2]));

      if (c != cols - 1, printf ("& "))
    );

    printf ("\\tabularnewline\\hline\n")
  )
};
