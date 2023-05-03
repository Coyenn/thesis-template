#import "template.typ": *
#show: project.with(
  title: "My Topic",
  authors: (
    (name: "Some Name", email: "name@name.com"),
  ),
)

= Thesis

#lorem(30)
@my_source

#figure(
  image("../dist/chart.svg", width: 50%),
  caption: [
    A caption
  ],
)

```js
const test = "Hello World"

console.log(test);
```

#pagebreak()

#bibliography("../bibliography/bibliography.yml")