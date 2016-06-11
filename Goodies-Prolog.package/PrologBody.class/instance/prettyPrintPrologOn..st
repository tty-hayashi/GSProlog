printing
prettyPrintPrologOn: aStream 
	| list |
	list := self.
	aStream cr; tab.
	[list cdr consp]
		whileTrue: 
			[list ~~ self
				ifTrue: 
					[aStream nextPutAll: ', '.
					aStream cr; tab].
			list car printPrologOn: aStream.
			list := list cdr].
	list ~~ self
		ifTrue: 
			[aStream nextPutAll: ', '.
			aStream cr; tab].
	list car printPrologOn: aStream