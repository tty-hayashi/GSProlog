printing
prettyPrintPrologOn: aStream 
	| head body list |
	head := self car.
	body := self cdr.
	head printPrologOn: aStream.
	body ~~ nil
		ifTrue: 
			[aStream nextPutAll: ' :- '.
			list := body.
			aStream cr; tab.
			[list cdr consp]
				whileTrue: 
					[list ~~ body
						ifTrue: 
							[aStream nextPutAll: ', '.
							aStream cr; tab].
					list car printPrologOn: aStream.
					list := list cdr].
			list ~~ self
				ifTrue: 
					[aStream nextPutAll: ', '.
					aStream cr; tab].
			list car printPrologOn: aStream].
	aStream nextPut: $.