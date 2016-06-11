accessing
selection: aSelection 
	| index |
	(index := list indexOf: aSelection) = 0
		ifFalse: [listIndex == index
				ifTrue: [self changed: #listIndex]
				ifFalse: [self toggleListIndex: index]].
	self changed: #selection