functions
reverse
	| list revlist mark |
	list := self.
	revlist := nil.
	[list consp]
		whileTrue: 
			[revlist == nil
				ifTrue: [revlist := mark := list car cons: revlist]
				ifFalse: [revlist := list car cons: revlist].
			list := list cdr].
	mark cdr: list.
	^revlist