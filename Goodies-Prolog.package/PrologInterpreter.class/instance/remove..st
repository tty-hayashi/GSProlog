system predicates
remove: aPrologSymbol
	userPredicates removeKey: aPrologSymbol ifAbsent: [^false].
	tracePredicates removeKey: aPrologSymbol ifAbsent: [].
	^true