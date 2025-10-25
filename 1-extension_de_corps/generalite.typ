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

#definition[
  Soit $k subset.eq K$ une extension et soit $alpha in K$.
  On considère l'homomorphisme d'anneau
  $
    phi_alpha &: k[X] -> K\
    &P mapsto P(alpha)
  $

  - Si $ker phi_alpha != {0}$, on dit que $alpha$ est algébrique sur $k$.

  - Si $ker phi_alpha = {0}$, on dit que $alpha$ est transcendant.
]<def_alg_tran>

#remark[
  Soit $k subset.eq K$ une extension et soit $alpha in K$. \

  - Si $alpha$ est algébrique sur $k$ alors $phi_alpha$ est injective. \
    Puisque $k[x]$ est intègre, $ker phi_alpha$ est un idéal premier. \
    Il existe donc un unique polynôme unitaire irreductible $P$ tel que
    $angle.l P angle.r = ker phi_alpha$.\
    On pose donc $mu_(alpha,k) in k[X]$ tel que
    $angle.l mu_(alpha,k) angle.r = ker phi_alpha$. \
    On appelle $mu_(alpha,k)$ le polynôme minimal de $alpha$ sur $k$.
    On se permettra de ne pas préciser $k$ s'il n'y a pas d’ambiguïté.
    Ainsi $phi_alpha$ induit un isomorphisme de
    $quot(k[X],mu_(alpha,k) )-> k[alpha]$.

  - Si $alpha$ est transcendant sur $k$ alors $phi_alpha$ induit un
    isomorphisme de $k[X] -> k[alpha]$.\
    Ainsi $k[alpha]$ est isomorphe à un anneau de polynôme et donc
    est une extension de degré infini.
]<rmq_importante>

#proposition[
  Si $k subset.eq K$ une extension et $alpha in K$ algébrique sur $k$
  alors $mu_alpha$ est un polynôme irreductible.
]<min_irr>

#proof[
  Supposons que $mu_alpha = P Q$ avec $P,Q in k[X]$ et $deg P$,$deg Q > 0$\
  On a $0 = mu_alpha(alpha) = P(alpha) Q(alpha)$ c'est à dire
  $Q(alpha) = 0$ ou $P(alpha) = 0$\
  Si $Q(alpha) = 0$, $Q in ker phi_alpha = angle.l mu_alpha angle.r$.
  Donc $mu_alpha$ divise $Q$. Puisque la factorisation n'est pas triviale
  $deg Q < deg mu_alpha$. Ce qui est absurde.



]

#definition[
  Soit $k subset.eq K$ une extension. On dit que $K$ est une extension algébrique
  si quelque soit $alpha in K$, $alpha$ est algébrique sur $k$. On dit qu'une extension est transcendante si elle n'est pas algébrique.
]

#theorem[
  Soit $k subset.eq K$ une extension et soit $alpha in K$. Les propositions suivantes sont équivalents :
  - $alpha$ est algébrique sur $k$
  - $k(alpha) = k[alpha]$
  - $k(alpha) tilde.eq quot(k[X], mu_(alpha,k))$
  - $k(alpha)$ est de dimension finie
]

#proof[

  - $1 => 2$ :
    Il suffit de montrer que $k[alpha]$ est un corps.
    Par la @min_irr, $mu_(alpha,k)$ est irreductible.
    De plus $k[X]$ est principal et donc $angle.l mu_(alpha,k) angle.r$
    est maximal. Ainsi $quot(k[X],mu_(alpha,k)) tilde.eq k[alpha] $ est un corps.

  - 2 => 1,3 :
    On considère le morphisme de la @def_alg_tran.
    Si $phi_alpha$ est injectif alors $k[X] tilde.eq k(alpha)$ ce
    qui est absurde. (ce qui prouve 1)\
    Donc $ker phi_alpha = angle.l mu_alpha angle.r$
    et par le premier théorème d'isomorphisme, $quot(k[X],mu_alpha) tilde.eq k(alpha)$.

  - 3 => 4 : $quot(k[X],mu_alpha)$ est un $k$-espace vectoriel
    de dimension $deg mu_alpha < oo$.

  - $4 => 1$ :
    Si $alpha$ n'est pas algébrique alors comme dit dans la @rmq_importante, $k[alpha]$ est isomorphe à un anneau de polynôme.
]