accessing
at: index 
	(index isInteger and: [index between: 257 and: 65536])
		ifTrue: [(index - 1) asCharacter isLetter
				ifTrue: [^true]
				ifFalse: [^false]].
	index = 0 ifTrue: [^false].
	^super at: index