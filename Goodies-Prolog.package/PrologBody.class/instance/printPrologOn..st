printing
printPrologOn: aStream 
	| list |
	list := self.
	[list cdr consp]
		whileTrue: 
			[list ~~ self ifTrue: [aStream nextPutAll: ', '].
			list car printPrologOn: aStream.
			list := list cdr].
	list ~~ self ifTrue: [aStream nextPutAll: ', '].
	list car printPrologOn: aStream