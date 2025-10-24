#import "../util.typ": *
Dans ce chapitre, tous les corps considérés seront commutatifs.


== Définitions et premiers résultats

\

#definition[
  Une *extension* d'un corps $k$ est un couple $(K,phi)$ où $K$ est un corps et $phi$ un homomorphisme d'anneaux de $k$ dans $K$.
]

#remark[
  Si $phi : k -> A$ est un homomorphisme d'anneaux, alors $phi$ est injective. En effet, $ker(phi)$ est un idéal de $k$ qui ne contient pas $1$. Donc $ker(phi) = {0}$. \
  Ainsi on identifie $k$ à $phi(k)$, ce qui donne lieu à la définition suivante : $K$ est une extension de $k$ si $K$ est un corps et $k subset.eq K$.
]

#proposition[
  Si $k subset.eq K$ un extension alors $KK$ est un $k$-espace vectoriel
]

#proof[
  pas très dur mais il faut l'écrire
]

#definition[
  Soit $k subset.eq K$ une extension. On définit le *degré de l'extension* $K$ sur $k$, noté $[K:k]$, la dimension de $K$ en tant que $k$-espace vectoriel.
]

#example[
  - $k$ est une extension de $k$.
  - $RR$ est une extension $QQ$, de plus $[RR:QQ] = oo$.
  - $QQ(sqrt(2))$ est une extension de $QQ$ et $[QQ(sqrt(2)):QQ] = 2$. \
    On verra plus en détails, les exemples de ce type dans la suite du cours.
]

#theorem(title : "de la base télescopique")[
  Soit $KK subset.eq LL subset.eq MM$ des extensions de corps.
  Si $(alpha_i)_(i in I)$ une base de $LL$ en tant que $KK$-espace vectoriel et $(beta_j)_(j in J)$ une base de $MM$ en tant que $LL$-espace vectoriel, alors :
  - $(alpha_i beta_j)_(i,j in I times J)$
    est une base $MM$ en tant que $KK$-espace vectoriel.
  - $KK subset.eq MM$ est une extension de degré fini si et seulement si
    $KK subset.eq LL$ et $LL subset.eq MM$ le sont. \
    Dans ce cas, $[MM:KK] = [MM:LL] times [LL:KK]$
]

#proof[

  - Soit $(lambda_k)_(k in I times J)$ tel que $sum_((i,j) in I times J) lambda_(i,j) alpha_i _j = 0$ \

    $
      sum_((i,j) in I times J) lambda_(i,j) alpha_i beta_j
      = sum_(i in I) alpha_i sum_(j in J) lambda_(i,j) beta_j = 0
    $

    Puisque $(alpha_i)_(i in I)$ est une famille libre, pour tout
    $i in I$, on a $sum_(j in J) lambda_(i,j) beta_j = 0$. \
    Par conséquent, pour tout $(i,j) in I times J$, $lambda_(i,j) = 0$.

  - Le deuxième point est une conséquence direct du premier.
]

#remark[
  Si $k subset.eq L$ est une extension telle que $[L:k]$ est un nombre premier positif de $ZZ$ alors il n'existe pas d'extension intermediate $K$, c'est à dire telle que,
  $k subset.neq K subset.neq L$.
]