private
fromReverseList: aPrologDotPair 
	| list terms mark |
	list := aPrologDotPair.
	terms := nil.
	[list consp]
		whileTrue: 
			[terms == nil
				ifTrue: [terms := mark := self class term: list car next: terms]
				ifFalse: [terms := self class term: list car next: terms].
			list := list cdr].
	mark cdr: list.
	^terms