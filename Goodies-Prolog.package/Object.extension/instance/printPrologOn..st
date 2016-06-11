*Goodies-Prolog-*prolog
printPrologOn: aStream 
	self == nil
		ifTrue: 
			[aStream nextPutAll: '[]'.
			^self].
	(self isKindOf: Number)
		ifTrue: 
			[self printOn: aStream.
			^self].
	aStream nextPut: ${.
	self printOn: aStream.
	aStream nextPut: $}