#import "../util.typ": *
Dans ce chapitre, tous les corps considérés seront commutatifs.


== Définitions et premiers résultats

\

#definition[
  Une *extension* d'un corps $k$ est un couple $(K,f)$ où $LL$ est un corps et $f$ un homomorphisme d'anneaux de $k$ dans $K$.
]

#remark[
  Si $f : k -> A$ est un homomorphisme d'anneaux, alors $f$ est injective. En effet, $ker(f)$ est un idéal de $k$ qui ne contient pas $1$. Donc $ker(f) = {0}$. \
  Ainsi on identifie $k$ à $f(k)$, ce qui donne lieu à la définition suivante : $K$ est une extension de $k$ si $K$ est un corps et $k subset.eq K$.
]

#proposition[
  Si $k subset.eq K$ un extension alors $KK$ est un $k$-espace vectoriel
]

#proof[
  à écrire
]

#definition[
  Soit $k subset.eq K$ une extension. On définit le *degré de l'extension* $K$ sur $k$, noté $[K:k]$, la dimension de $K$ en tant que $k$-espace vectoriel.
]

