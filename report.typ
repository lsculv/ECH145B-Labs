// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  logo: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)

  // Save heading and body font families in variables.
  let body-font = "Linux Libertine"
  let sans-font = "Inria Sans"

  // Set body font family.
  set text(font: body-font, lang: "en")
  
  show heading: it => {
    if it.level > 1 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  show heading: set text(font: sans-font)
  set par(leading: 0.75em)

  // Title page.
  v(3.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(font: sans-font, 2.2em, weight: 700, title)

  // Author information.
  pad(
    top: 0em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.affiliation
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()

  
  // Abstract page.
    v(1fr)
  align(center)[
      #heading(
        outlined: false,
        numbering: none,
        text(0.85em, smallcaps[Abstract]),
      )
      #abstract
    ]
    v(1.618fr)
    pagebreak()

    // Table of contents.
    outline(title: [Table of Contents],depth: 1, indent: true)
    pagebreak()
    

    // Main body.
    set par(justify: true)
    set text(hyphenate: false)
  
    body
}