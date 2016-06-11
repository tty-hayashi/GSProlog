printing
questionPrintPrologOn: aStream 
	| head body |
	head := self head.
	body := self body.
	aStream nextPutAll: '?- '.
	head printPrologOn: aStream.
	body ~~ nil
		ifTrue: 
			[aStream nextPutAll: ', '.
			body printPrologOn: aStream].
	aStream nextPut: $.