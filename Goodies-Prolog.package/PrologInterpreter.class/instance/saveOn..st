system support
saveOn: aFileStream 
	| def |
	userPredicates associations asSortedCollection do: 
		[ :assoc | 
		def := assoc value.
		[ def consp ] whileTrue: 
			[ aFileStream nextPutAll: def car prettyPrintPrologString , '\' withCRs.
			def := def cdr ] ]