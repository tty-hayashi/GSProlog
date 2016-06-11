printing
printPrologOn: aStream cdr: tail level: anInteger 
	| d count |
	d := tail.
	count := 1.
	[d consp]
		whileTrue: 
			[count >= PrologDotPairPrintHorizontalLevel
				ifTrue: 
					[aStream nextPutAll: ' ... ]'.
					^self].
			aStream nextPut: $,.
			d car consp
				ifTrue: [d car printPrologOn: aStream level: anInteger + 1]
				ifFalse: [d car printPrologOn: aStream].
			"d car printPrologOn: aStream level: anInteger + 1."
			count := count + 1.
			d := d cdr].
	d isNil
		ifTrue: [aStream nextPut: $]]
		ifFalse: 
			[aStream nextPut: $|.
			d printPrologOn: aStream.
			aStream nextPut: $]]