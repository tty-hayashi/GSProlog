printing
prettyPrintPrologOn: aStream 
	| head body |
	head := self head.
	body := self body.
	head printPrologOn: aStream.
	body ~~ nil
		ifTrue: 
			[aStream nextPutAll: ' :- '.
			body prettyPrintPrologOn: aStream].
	aStream nextPut: $.