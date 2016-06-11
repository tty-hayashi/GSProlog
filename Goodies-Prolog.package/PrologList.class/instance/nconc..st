functions
nconc: aPrologDotPair 
	| list |
	list := self.
	[list consp]
		whileTrue: [(list cdr consp)
				ifTrue: [list := list cdr]
				ifFalse: 
					[list cdr: aPrologDotPair.
					^self]].
	^aPrologDotPair