pluggable messages
smenuMorph: aMenu 
	| collection labelList selectionsArray receiver |
	collection := OrderedCollection new.
	collection add: 'update' -> #update.
	collection add: 'update:' -> #update:.
	collection add: 'update:with:' -> #update:with:.
	collection add: 'update:with:with:' -> #update:with:with:.
	collection.
	labelList := collection
				collect: [:each | each key].
	selectionsArray := collection
				collect: [:each | each value].
	receiver := thisContext  sender receiver.
collection do: [:each | 
	aMenu
		add: each key 
		target: self
		selector: each value
		argument: receiver
		"argument: (Array with: self with: thisContext sender receiver)"
].
	aMenu addLine.
	^ aMenu