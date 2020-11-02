/* ----------------------------------------------------------------- */
/* Código básico para fracciones continuas de números cuadráticos    */
/* ----------------------------------------------------------------- */

/* Verificar si x es racional */
israt(x) = type(x) == "t_FRAC" || type(x) == "t_INT";

/* ----------------------------------------------------------------- */
/* Evaluar un número cuadrático */

evquad(y,d) = subst(lift(y),x,sqrt(d));

/* ----------------------------------------------------------------- */
/* Encontrar v en la lista x */

listsearch(x,v) = {
  for (i=1, #x, if(x[i]==v, return(i)));
  0;
};

/* ----------------------------------------------------------------- */
/* Separar la lista x en la posición n */

listsplit(x,n) = {
  local (len=#x, x1, x2);
  x1 = vector(n-1);
  x2 = vector(len-n+1);

  for (i=0, #x2-1,
    x2[len-n-i+1] = x[len-i];
    listpop (x);
  );

  for (i=0, #x1-1,
    x1[n-1-i] = x[n-1-i];
    listpop(x)
  );

  [x1,x2]
};

/* ----------------------------------------------------------------- */

/* Fracción continua para u + v\sqrt{d},
   donde d > 0 es libre de cuadrados */

quadcontfrac (u,v,d) = {
    if (!israt(u) || !israt(v),
        error ("Los coeficientes deben ser racionales"));

    if (type(d) != "t_INT" || d <= 0 || !issquarefree(d),
        error ("Esperando un entero d > 0 libre de cuadrados"));

    local (y,a, yn, an);

    yn = List ([]);
    an = List ([]);

    y = Mod (u + v*x, x^2 - d);

    while (1,
      a = floor (evquad(y,d));
      listput (yn,y);
      listput (an,a);

      y = 1 / (y-a);

      /* Los y_n se vuelven periódicos: */
      local (n = listsearch(yn,y));
      if (n != 0,
        return (listsplit(an,n))
      )
   );
};

/* ----------------------------------------------------------------- */

percontfractex(d) = {
    local (fr = quadcontfrac (0,1,d));

    printf ("\\sqrt{%d} & = ", d);
    printf ("[");

    for (i=1, #fr[1], printf ("%d,", fr[1][i]));

    printf ("\\overline{");

    for (i=1, #fr[2],
      printf ("%d", fr[2][i]);
      if (i != #fr[2], printf (","))
    );

    printf ("}] \\\\\n");
};

/* ----------------------------------------------------------------- */

percontfractab (N) = {
  for (d=2,N,
    if (issquarefree(d),
      percontfractex(d)
    )
  )
};

/* Ejemplo:
   percontfractab (100); */

/* ----------------------------------------------------------------- */
