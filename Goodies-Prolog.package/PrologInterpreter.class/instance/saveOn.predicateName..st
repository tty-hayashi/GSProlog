system support
saveOn: aFileStream predicateName: aPrologSymbol 
	| def |
	def := userPredicates 
		at: aPrologSymbol
		ifAbsent: [  ].
	def == nil ifFalse: 
		[ [ def consp ] whileTrue: 
			[ aFileStream nextPutAll: def car prettyPrintPrologString , '\' withCRs.
			def := def cdr ] ]