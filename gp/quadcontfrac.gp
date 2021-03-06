/* ----------------------------------------------------------------- */
/* Código básico para fracciones continuas de \sqrt{d}               */
/* ----------------------------------------------------------------- */

quadcontfrac(d) = {
    if (type(d) != "t_INT" || d <= 1 || issquare(d),
        error ("Esperando un no-cuadrado d > 1"));

    local (an = List(), A = 0, B = 1, a = floor(sqrt(d)));

    listput (an,a);

    while (1,
      A = a*B - A;
      B = (d - A^2)/B;
      a = floor ((A + sqrt(d))/B);

      listput (an,a);

      if (B == 1,
        return (Vec(an))  /* ¡Período! */
      )
   );
};

/* ----------------------------------------------------------------- */
/* Unidad fundamental de Z [\sqrt{d}]                                */
/* ----------------------------------------------------------------- */

funit (d) = {
  local (cfrac = quadcontfrac(d), M, s);
  M = contfracpnqn (cfrac, #cfrac-2);
  s = matsize(M)[2];
  M[1,s] + M[2,s]*x;
};

/* ----------------------------------------------------------------- */

quadcontfractex(d) = {
    local (fr = quadcontfrac(d));

    printf ("\\sqrt{%d} & = ", d);
    printf ("[");

    printf ("%d,", fr[1]);

    printf ("\\overline{");

    for (i=2, #fr,
      printf ("%d", fr[i]);
      if (i != #fr, printf (","))
    );

    printf ("}] \\\\\n");
};

/* ----------------------------------------------------------------- */

percontfractab (N) = {
  for (d=2,N,
  if (issquarefree(d),
      quadcontfractex(d)
    )
  )
};

/* Ejemplo: percontfractab (100); */

/* ----------------------------------------------------------------- */
