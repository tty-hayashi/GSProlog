printing
printPrologOn: aStream 
	| functor terms |
	functor := self functor.
	terms := self terms.
	functor printPrologOn: aStream.
	terms == nil
		ifFalse:
			[(terms consp)
				ifTrue: [terms printPrologOn: aStream]
				ifFalse:
					[aStream nextPutAll: '(|'.
					terms printPrologOn: aStream.
					aStream nextPut: $)]]