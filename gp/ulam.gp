/* ---------------------------------------------------------------------- */

spiral_radius = 100;
euler_primes = List ([]);
x = 0;

{while (x^2 + x + 41 <= (spiral_radius+2)^2,
  if (isprime (x^2 + x + 41),
    listput (~euler_primes, x^2 + x + 41)
  );
  x++
)};

/* ---------------------------------------------------------------------- */

draw_square (p,x) = {
  local (px = real (x), py = imag (x));
  printf ("  \\fill");
  if (setsearch (euler_primes, p),
    if (p <= 1601,
      printf ("[blue]"),
      printf ("[red]")
    )
  );
  printf (" (%d,%d) -- (%d+1,%d) -- (%d+1,%d+1) -- (%d,%d+1) -- cycle; %% p = %d\n", px,py,px,py,px,py,px,py,n);
};

/* ---------------------------------------------------------------------- */

ulam (r) = {
  local (dir = 1, pos, n=1);

  for (len = 1, r+1,
    for (i = 1,2,
      for (j = 1, len,
      	if (isprime (n),
	  draw_square (n,pos);
	);

        pos = pos + dir;
	n = n+1;
      );
      dir = dir*I
    )
  );

  for (j = 1, r+1,
    if (isprime (n),
      draw_square (n,pos);
    );

    pos = pos + dir;
    n = n+1
  )
};

/* ---------------------------------------------------------------------- */

ulam (spiral_radius);
