######################################################################
# Verificar si (G,H,H') es una tripla de Gassmann;                   #
# cc son las clases de conjugación en G                              #
######################################################################

isGassmannTripple := function (H,Hp,cc)
  local c;

  for c in cc do
    if Size(Intersection(H,c)) <> Size(Intersection(Hp,c)) then
      return false;
    fi;
  od;

  return true;
end;;


######################################################################
# Encontrar una tripla de Gassmann (G,H,H')                          #
# con [G:H] mínimo posible                                           #
######################################################################

findGassmannTriple := function (G)
  local cc, ccSubgr, i, j, H, Hp, hSize, triple;

  triple := [];
  hSize := 0;
  triple := [];

  cc := ConjugacyClasses(G);
  ccSubgr := ConjugacyClassesSubgroups(G);

  for i in [1..Size(ccSubgr)] do
    for j in [i+1..Size(ccSubgr)] do
      # H and H' must have the same size
      if (Size(Representative(ccSubgr[i])) <>
            Size(Representative(ccSubgr[j]))) then
        continue;
      fi;

      for H in Elements (ccSubgr[i]) do
        for Hp in Elements (ccSubgr[j]) do
          if isGassmannTripple (H,Hp,cc) and Size(H) > hSize then
            triple := [G,H,Hp];
            hSize := Size(H);
          fi;
        od;
      od;

    od;
  od;

  return triple;
end;;


######################################################################
# Buscar triplas de Gassmann entre los grupos de orden <= N          #
######################################################################

smallGroupsGassmann := function (N)
  local o, Gs, i;

  for o in [1..N] do
    Gs := AllSmallGroups(o);
    for i in [1..Size(Gs)] do
      if findGassmannTriple(Gs[i]) <> [] then
        Print ([o,i],"\n");
      fi;
    od;
  od;
end;
