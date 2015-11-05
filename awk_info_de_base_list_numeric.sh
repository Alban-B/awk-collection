### ce script prend en entrée stdin une liste de nombre et ressort la somme des nombres / le nombre d'occurences/ la moyenne / médiane / min / max
#!/bin/sh
sort -n | awk '
  BEGIN {
    c = 0;
    sum = 0;
  }
  $1 ~ /^[0-9]*(\.[0-9]*)?$/ {
    a[c++] = $1;
    sum += $1;
  }
  END {
    ave = sum / c;
    if( (c % 2) == 1 ) {
      median = a[ int(c/2) ];
    } else {
      median = ( a[c/2] + a[c/2-1] ) / 2;
    }
    OFS="\t";
    print sum, c, ave, median, a[0], a[c-1];
  }
'
