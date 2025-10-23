#import "common.typ": definition, example, remark, lemma, proposition, theorem, corollary, proof, notation

// Document template
#let lecture(
  logo: none,
  tagline: none,
  title: none,
  authors: (),
  author-text: none,
  abstract: none,
  enable-outline: false,
  breaks: auto, // (title, abstract, outline), auto, bool
  chapters: false,
  lang : "en",
  body,
) = {
  import "@preview/great-theorems:0.1.2": great-theorems-init
  import "common.typ": get-translation, accent-color

  // Argument processing
  if breaks == auto {
    breaks = (title: abstract != none, abstract : true, outline: true)
  } else if type(breaks) == bool {
    breaks = (title: breaks, abstract: breaks, outline: breaks)
  }

  // Document config
  set document(title: title, author: authors)
  set page(supplement: [#get-translation("page")])
  set text(lang: lang)

  show heading: set par(justify: false)
  show heading: set text(fill: accent-color)
  show link: set text(fill: accent-color)
  show ref: set text(fill: accent-color)
  show math.equation: box
  show: great-theorems-init

  // Logo
  align(center, logo)

  // Title
  if tagline != none or title != none {
    set text(fill: accent-color)
    let l = line(length: 100%, stroke: 2pt + accent-color)
    l
    align(center)[
      #text(size: 18pt, weight: "bold", smallcaps(tagline))

      #text(size: 25pt, title)
    ]
    l
  }

  // Authors
  {
    set text(size: 14pt, style: "italic")
    if authors != () {
      grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        align: center,
        gutter: 1em,
        ..authors
      )
    }

    align(center, author-text)
  }

  if breaks.title { pagebreak(weak: true) }
  set page(numbering: "1 / 1")

  // Abstract
  if abstract != none {
    set par(justify: true)
    pad(x: 6%)[
      #align(center, heading(outlined: false, get-translation("abs")))

      #abstract
    ]

    if breaks.abstract { pagebreak(weak: true) }
  }

  // Outline
  if enable-outline {
    align(center + horizon, outline())

    if breaks.outline { pagebreak(weak: true) }
  }

  // Body
  set heading(numbering: "I-1-a.", supplement: get-translation("title"))

  show heading.where(level: 1): set text(size: 18pt)
  show heading.where(level: 2): set text(size: 16pt)

  show heading.where(level: 1): it => {
    if chapters and it.numbering != none {
      pagebreak(weak: true)
      set text(size: 25pt)
      v(15%)
      [ #get-translation("chap") #counter(heading).display() \ #it.body ]
      v(16pt)
    } else { it }
  }

  body
}

// Appendix template
#let appendix(body) = {
  import "common.typ": get-translation

  pagebreak(weak: true)

  counter(heading).update(0)
  set heading(numbering: "A.1.", supplement: get-translation("app"))
  show heading.where(level: 1): it => [
    #get-translation("app") #counter(heading).display() #it.body
  ]

  body
}
