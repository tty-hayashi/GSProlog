printing
printPrologOn: aStream level: anInteger 
	anInteger > PrologDotPairPrintVerticalLevel
		ifTrue: 
			[aStream nextPutAll: ' ... '.
			^self].
	aStream nextPutAll: '['.
	carPart consp
		ifTrue: [carPart printPrologOn: aStream level: anInteger + 1]
		ifFalse: [carPart printPrologOn: aStream].
	self
		printPrologOn: aStream
		cdr: cdrPart
		level: anInteger