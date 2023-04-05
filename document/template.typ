#let project(title: "", authors: (), logo: none, body) = {
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
  )
  set text(
    font: "Times New Roman",
    lang: "en",
    size: 11pt,
    hyphenate: true,
    fill: rgb(57, 58, 66)
  )
  set heading(
    numbering: "1.1"
  )
  set par(
    justify: true,
    leading: 1em
  )

  // Headings are not affected by par.leading, so we need to set leading here
  show heading: it => pad(bottom: 0.85em, top: 0em, it)

  // Title page
  align(
    horizon,
    align(
      center,
      text(2em, weight: 700, title),
    )
  )

  // Author information.
  align(center,
    pad(
      top: 0.7em,
      bottom: 15em,
      grid(
        columns: (1fr),
        gutter: 1em,
        ..authors.map(author => align(center)[
          *#author.name* \
          #author.email
        ]),
      ),
    )
  )

  pagebreak()

  // Table of contents.
  outline(depth: 3, indent: true)

  pagebreak()

  // Main body.
  body
}