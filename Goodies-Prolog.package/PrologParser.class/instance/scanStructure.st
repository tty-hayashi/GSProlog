scan
scanStructure
	| functor terms |
	functor := self nextToken.
	(tokenType == #symbol or: [tokenType == #variable])
		ifTrue: 
			[terms := self scanTerms.
			^PrologStructure functor: functor terms: terms].
	failBlock value: 'Syntax error'