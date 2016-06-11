system predicates
userListing: aPrologSymbol 
	| def |
	def := userPredicates at: aPrologSymbol ifAbsent: [nil].
	def == nil ifTrue: [^false].
	[def consp]
		whileTrue: 
			[textCollector show: def car prettyPrintPrologString , '\' withCRs.
			def := def cdr].
	^true