system predicates
systemListing: aPrologSymbol
	| def |
	def := systemPredicates at: aPrologSymbol ifAbsent: [nil].
	def == nil ifTrue: [^false].
	[def consp]
			whileTrue: 
				[textCollector show: def car prettyPrintPrologString , '\' withCRs.
				def := def cdr].
	^true