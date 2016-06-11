converting
asPrologList
	| list new tail |
	new := self car cons: nil.
	tail := new.
	list := self cdr.
	[list consp]
		whileTrue: 
			[tail cdr: (list car cons: nil).
			tail := tail cdr.
			list := list cdr].
	tail cdr: list.
	^new