// This file handles the display of footnotes

#let cntrs = (:)
#let cntrs_id = "note_cntr"
#let notes = state("dict", (:))
#let note(it, note) = {
	locate(loc => {
		let pg = loc.page()
		let cntr = counter(cntrs_id + str(pg))
		notes.update(dict => {
			let vec = ()
			if str(pg) in dict.keys() {
				vec = dict.at(str(pg))
			}
			vec.push(note)
			dict.insert(str(pg), vec)
			dict
		})

		it + super(cntr.display())
		cntr.step()
	})
}

#let display() = {
	set text(size: 8pt)
	locate(loc => {
		let pg = loc.page()
		let dict = notes.final(loc)
		let vec = ()
		if str(pg) in dict.keys() {
			vec = dict.at(str(pg))
		}

		if vec.len() > 0 {
            line(length: 100%)
            for i in range(0, vec.len()) {
                super[#{i + 1}] + h(1pt) + vec.at(i)
                linebreak()
            }
		}
	})
}