printing
printPrologOn: aStream 
	(self asString at: 1)
		= $~
		ifTrue: [aStream nextPut: $~]
		ifFalse: [aStream nextPutAll: self asString]