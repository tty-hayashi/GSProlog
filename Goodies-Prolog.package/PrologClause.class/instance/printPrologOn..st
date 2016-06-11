printing
printPrologOn: aStream 
	| head body |
	head := self head.
	body := self body.
	aStream nextPut: $(.
	head printPrologOn: aStream.
	body == nil
		ifFalse: 
			[aStream nextPutAll: ', '.
			body printPrologOn: aStream].
	aStream nextPut: $)