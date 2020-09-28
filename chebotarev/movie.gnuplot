if (ARGC!=2) {
   print "Missing filename and title!"
   quit
}

set term gif animate delay 15 size 1024,768
set output ARG1.'.gif'

set style fill solid
set boxwidth 0.6
set yrange [0:1]
set ytics 0,0.1,1.0
set grid ytics noxtics

do for [i=1:300] {
  set key title sprintf("%s\n%04d primes",ARG2,i*5) right at graph 1,0.99

  plot ARG1.'-hist.dat' index(i-1) using 1:3:xtic(2) with boxes notitle linecolor rgb "#003399"
}
