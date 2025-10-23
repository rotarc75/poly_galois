#import "@preview/rich-counters:0.2.2": rich-counter
#import "@preview/great-theorems:0.1.2": mathblock, proofblock

// CHANGE ACCENT COLOR HERE //
#let accent-color = rgb("#8A1538")

// Translations
#let translations = (
  fr : (
    def : "Définition",
    thm : "Théorème",
    prop : "Proposition",
    lemma : "Lemme",
    cor : "Corollaire",
    ex : "Exemple",
    rem : "Remarque",
    proof : "Démonstration",
    page : "Page",
    title : "Titre",
    chap : "Chapitre",
    abs : "Résumé",
    app : "Annexe",
    nota : "Notation",
  ),
  en : (
    def : "Definition",
    thm : "Theorem",
    prop : "Proposition",
    lemma : "Lemma",
    cor : "Corollary",
    ex : "Example",
    rem : "Remark",
    proof : "Proof",
    page : "Page",
    title : "Title",
    chap : "Chapter",
    abs : "Abstract",
    app : "Appendix",
    nota : "Notation",
  ),
)
#let get-translation(key, lang : auto) = context {
  let l = if lang == auto { text.lang } else { lang }
  translations.at(l).at(key)
}

// Math
#let accent-text = text.with(fill: accent-color)
#let math-counter = rich-counter(identifier: "math", inherited_levels: 2)
#let math-block(name) = mathblock(
  blocktitle: get-translation(name),
  counter: math-counter,
  prefix: nb => accent-text[*#get-translation(name) #nb.*],
  titlix: title => accent-text[(#title)]
)
#let important-block(name) = math-block(name).with(
  inset: (left: 6pt),
  stroke: (left: 1.5pt + accent-color),
)

#let definition = math-block("def")
#let example = math-block("ex")
#let remark = math-block("rem")
#let notation = math-block("nota")
#let lemma = important-block("lemma")
#let proposition = important-block("prop")
#let theorem = important-block("thm")
#let corollary = important-block("cor")

#let proof = proofblock(
  blocktitle: get-translation("proof"),
  prefix: accent-text[_#get-translation("proof")._],
  suffix: accent-text[$square.filled.small$],
)
