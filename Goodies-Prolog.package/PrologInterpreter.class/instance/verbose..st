system predicates
verbose: aPrologSymbol 
	aPrologSymbol isPrologTrue
		ifTrue: [verbose := true]
		ifFalse: [verbose := false].
	^true