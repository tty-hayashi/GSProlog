printing
printPrologOn: aStream 
	aStream nextPut: ${.
	aStream nextPutAll: self source.
	aStream nextPut: $}