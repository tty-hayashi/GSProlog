functions
member: anObject 
	| list |
	list := self.
	[list consp]
		whileTrue: 
			[anObject = list car ifTrue: [^list].
			list := list cdr].
	^nil