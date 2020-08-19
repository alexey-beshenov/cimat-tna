eisenstein_cubes_mod (p) = {
  local (cubes = List ([]));

  for (a=0,p-1,
    for (b=0,p-1,
      listput (cubes, Mod(Mod(a,p) + Mod(b,p)*x, polcyclo(3))^3)
    )
  );

  Set (cubes)
};


/* ----------------------------------------------------------------------

  ? liftall (eisenstein_cubes_mod(5))
  % = [0, 1, 2, 3, 4, 2*x + 1, 4*x + 2, x + 3, 3*x + 4]

---------------------------------------------------------------------- */
