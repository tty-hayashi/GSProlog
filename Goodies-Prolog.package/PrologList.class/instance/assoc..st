functions
assoc: anObject 
	| list assoc |
	list := self.
	[list consp]
		whileTrue: 
			[assoc := list car.
			anObject = assoc car ifTrue: [^assoc].
			list := list cdr].
	^nil