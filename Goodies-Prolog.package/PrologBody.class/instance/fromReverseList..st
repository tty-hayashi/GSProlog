private
fromReverseList: aPrologDotPair 
	| list body mark |
	list := aPrologDotPair.
	body := nil.
	[list consp]
		whileTrue: 
			[body == nil
				ifTrue: [body := mark := self class structure: list car next: body]
				ifFalse: [body := self class structure: list car next: body].
			list := list cdr].
	mark cdr: list.
	^body