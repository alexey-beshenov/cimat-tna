/* ----------------------------------------------------------------------
  Ejemplo de uso de rnf:
  el polinomio mínimo de \sqrt{2} + (1+\sqrt{5})/2
---------------------------------------------------------------------- */

K = nfinit(t^2-2);
L = rnfinit(K, x^2-5);
a = rnfeltreltoabs(L, t + (1+x)/2)
f = minpoly(a)


/* ----------------------------------------------------------------------

  % = x^4 - 2*x^3 - 5*x^2 + 6*x - 1
  ? subst (f, x, sqrt(2) + (1+sqrt(5))/2)
  % = -2.115889831480117514 E-37
  ? algdep (sqrt(2) + (1+sqrt(5))/2, 4)
  % = x^4 - 2*x^3 - 5*x^2 + 6*x - 1

---------------------------------------------------------------------- */
