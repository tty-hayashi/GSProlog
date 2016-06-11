functions
length
	| list count |
	list := self.
	count := 0.
	[list consp]
		whileTrue: 
			[count := count + 1.
			list := list cdr].
	^count