system predicates
saving: aPrologSymbol
	| def |
	def := tracePredicates at: aPrologSymbol ifAbsent: [ userPredicates at: aPrologSymbol ifAbsent: [  ] ].
	def == nil
		ifTrue: [ ^ false ].
	(self containingWindow fileSave: 'Please input a filename for saving.' translated)
		ifNotNilDo: [ :aFileReference | 
			self saveOn: aFileReference writeStream predicateName: aPrologSymbol.
			^ true ].
	^ false