system predicates
listPrint: aPrologDotPair 
	| list |
	aPrologDotPair consp ifFalse: [^false].
	list := aPrologDotPair.
	[list consp]
		whileTrue: 
			[textCollector show: list car printPrologString , ' '.
			list := list cdr].
	^true