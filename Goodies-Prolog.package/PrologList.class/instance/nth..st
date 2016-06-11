accessing
nth: anInteger 
	| count list |
	anInteger <= 0 ifTrue: [^self].
	count := 1.
	list := self.
	[list consp]
		whileTrue: 
			[count >= anInteger ifTrue: [^list car].
			count := count + 1.
			list := list cdr].
	^nil