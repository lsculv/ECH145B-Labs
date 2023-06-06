// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", body) = {
  // Set the document's basic properties.
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title row.
  align(left)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
  ]

  // Main body.
  set par(justify: true)
  set text(hyphenate: false)
  body
}
