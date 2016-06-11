system predicates
nospy: aPrologSymbol 
	| def |
	def := tracePredicates at: aPrologSymbol ifAbsent: [nil].
	def == nil ifTrue: [^false].
	userPredicates at: aPrologSymbol put: def.
	tracePredicates removeKey: aPrologSymbol.
	^true