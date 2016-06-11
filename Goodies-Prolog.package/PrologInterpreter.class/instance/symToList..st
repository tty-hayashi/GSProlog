system predicates
symToList: numOrSym 
	| pstring |
	pstring := self symToStr: numOrSym.
	^PrologList list: pstring string asByteArray