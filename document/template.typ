#import "notes.typ"
#let project(title: "", authors: (), body) = {
  // Main document settings
  set document(
    author: authors.map(a => a.name),
    title: title,
  )
  set page(
    numbering: "1",
    number-align: center,
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    footer: [
      #grid(columns: (100% - 1em, 1em), gutter: 1.5em,
        place(left, dy: 0%)[#notes.display()],
        place(right, dy: 0%)[#counter(page).display()]
      )
    ],
    footer-descent: 0pt,
  )
  set text(
    font: "Times New Roman",
    ligatures: true,
    lang: "en",
    size: 11pt,
    hyphenate: false,
    fill: rgb(57, 58, 66),
    kerning: true
  )
  set heading(
    numbering: "1.1"
  )

  // Headings are not affected by par.leading, so we need to set leading here
  show heading: it => pad(bottom: 0.85em, top: 0.4em, it)

  // Figures need a slight padding bottom
  show figure: it => pad(bottom: 0.5em, it)

  // Set inline code background color
  show raw.where(block: false): box.with(
    fill: rgb(240, 240, 240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Set block code background color
  show raw.where(block: true): block.with(
    fill: rgb(240, 240, 240),
    inset: 10pt,
    radius: 2pt,
    width: 100%,
  )

  // Title page
  align(
    horizon,
    align(
      center,
      text(2em, weight: 700, title),
    )
  )

  // Author information.
  align(
    bottom,
    grid(
      columns: (1fr),
      gutter: 1em,
      ..authors.map(author => align(left)[
        *#author.name* \
        #link("mailto:" + author.email)
      ]),
    ),
  )

  pagebreak()

  // Table of contents.
  outline(depth: 3, indent: true)

  pagebreak()

  // Set paragraph to fill the page width.
  set par(
    justify: true,
    leading: 1em
  )

  // Main body.
  body
}