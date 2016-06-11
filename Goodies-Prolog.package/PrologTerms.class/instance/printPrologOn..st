printing
printPrologOn: aStream 
	| list |
	aStream nextPut: $(.
	list := self.
	[list cdr consp]
		whileTrue: 
			[list ~~ self ifTrue: [aStream nextPut: $,].
			list car printPrologOn: aStream.
			list := list cdr].
	list ~~ self ifTrue: [aStream nextPut: $,].
	list car printPrologOn: aStream.
	list cdr isNil
		ifTrue: [aStream nextPut: $)]
		ifFalse:
			[aStream nextPut: $|.
			list cdr printPrologOn: aStream.
			aStream nextPut: $)]