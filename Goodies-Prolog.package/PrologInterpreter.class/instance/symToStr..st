system predicates
symToStr: numOrSym 
	numOrSym isNil ifTrue: [^PrologString fromString: '[]'].
	(self number: numOrSym)
		ifTrue: [^PrologString fromString: numOrSym printString].
	^PrologString fromString: numOrSym string