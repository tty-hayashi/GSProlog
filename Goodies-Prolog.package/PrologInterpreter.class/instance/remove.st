system predicates
remove
	userPredicates keys do: 
		[:aPrologSymbol | 
		userPredicates removeKey: aPrologSymbol ifAbsent: [].
		tracePredicates removeKey: aPrologSymbol ifAbsent: []].
	^true