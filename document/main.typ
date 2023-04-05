#import "template.typ": *
#show: project.with(
  title: "Test Thesis",
  authors: (
    (name: "Some Person", email: "somemail@mail.com"),
  ),
)

= #lorem(3)
#lorem(60)

#figure(
  image("../dist/sample.png", height: 20em),
  caption: "An image"
)
