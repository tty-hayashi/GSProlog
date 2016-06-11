private
fromReverseList: aPrologDotPair 
	| list definition |
	list := aPrologDotPair.
	definition := nil.
	[list consp]
		whileTrue: 
			[definition := self class clause: list car next: definition.
			list := list cdr].
	^definition