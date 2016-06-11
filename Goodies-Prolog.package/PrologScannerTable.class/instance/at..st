accessing
at: index 
	(index isInteger and: [index between: 257 and: 65536])
		ifTrue: [(index - 1) asCharacter isLetter
				ifTrue: [^#xSymbol]
				ifFalse: [^#xBinary]].
	index = 0 ifTrue: [^#xDelimiter].
	^super at: index