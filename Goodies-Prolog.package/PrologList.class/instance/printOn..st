printing
printOn: aStream 
	aStream nextPutAll: self class printString.
	aStream nextPutAll: '('.
	aStream nextPutAll: self printPrologString.
	aStream nextPutAll: ')'