/* ----------------------------------------------------------------------
  Cálculo tonto del anillo de enteros de Q (19^(1/3)).
  Primero tomamos Z [19^(1/3)] = Z [\alpha]
  y calculamos su discriminante:

  ? poldisc (x^3-19)
  % = -9747
  ? factor (%)
  % = 
  [-1 1]

  [ 3 3]

  [19 2]

  Entonces, en Z [\alpha] pueden faltar elementos enteros de la forma
    a/m + b/m \alpha + c/m \alpha^2,
  donde m = 3, 19, 3*19.
---------------------------------------------------------------------- */

polisintegral (f) = denominator(content(f)) == 1;

test (m) = {
  for (a=0,m-1,
    for (b=0,m-1,
      for (c=0,m-1,
        local (elt = (a + b*x + c*x^2)/m);
        if (polisintegral (minpoly (Mod (elt, x^3 - 19))),
          print (elt)
        )
      )
    )
  )
};

/* ----------------------------------------------------------------------
  ? test(3)
  0
  1/3*x^2 + 1/3*x + 1/3
  2/3*x^2 + 2/3*x + 2/3

  ? test(19)
  0

  ? test (3*19)
  0
  1/3*x^2 + 1/3*x + 1/3
  2/3*x^2 + 2/3*x + 2/3
---------------------------------------------------------------------- */
