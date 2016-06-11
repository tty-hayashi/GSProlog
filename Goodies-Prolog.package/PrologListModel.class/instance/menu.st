pluggable messages
menu
	selectionMenu isNil
		ifTrue: [selectionMenu := self makeSelectionMenu: self menuItems].
	^ selectionMenu