list
toggleListIndex: aNumber 
	"What to do when the user chooses an item"
	listIndex == aNumber
		ifTrue: [listIndex := 0]
		ifFalse: [listIndex := aNumber].
"	self changed: #listIndex."
	self changed: #index