examples
example
	"PrologListModel example."
	| model listView topView |
	model := self new initialize.
	model list: model musicBands.
	listView := PluggableListMorph
				on: model
				list: #musicBands
				selected: #index
				changeSelected: #index:
				menu: #menu:.
	topView := (SystemWindow labelled: 'PrologListModel Test')
				model: model.
	topView minimumExtent: 200 @ 200.
	topView
		addMorph: listView
		frame: (0 @ 0 corner: 1 @ 1).
	[topView visible: false.
	topView openInWorld.
	topView extent: 200 @ 200]
		ensure: [topView visible: true].
	^ topView