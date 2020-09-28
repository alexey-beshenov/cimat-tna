#!/usr/bin/bash

rm -f ./*.dat

echo "Calculating decompositions in PARI/GP..."
gp -s 64000000 -q decomp-stat.gp
echo ""

make_movie () {
    title=$(sed -n '1 s/^#\s// p' "$1.dat")

    ./process-data.pl "$1.dat" > "$1-hist.dat"

    echo "Running gnuplot for $1..."
    gnuplot -c movie.gnuplot "$1" "$title"

    echo "Running ffmpeg for $1..."
    ffmpeg -hide_banner -loglevel warning -i "$1.gif" -vf 'scale=trunc(in_w/2)*2:trunc(in_h/2)*2' -c:v libx264 -b:v 2000k -y -pix_fmt yuv420p -f mp4 "$1.mp4"

    echo ""
}

for datafile in *[^-stat].dat; do
    make_movie "${datafile%.dat}"
done
