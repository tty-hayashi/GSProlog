system predicates
spy: aPrologSymbol 
	| def reverseClone tracedef |
	def := userPredicates at: aPrologSymbol ifAbsent: [nil].
	def == nil ifTrue: [^false].
	(tracePredicates at: aPrologSymbol ifAbsent: [nil]) isNil ifFalse: [^true].
	tracePredicates at: aPrologSymbol put: def.
	reverseClone := nil.
	[def consp]
		whileTrue: 
			[reverseClone := def car cons: reverseClone.
			def := def cdr].
	tracedef := nil.
	[reverseClone consp]
		whileTrue: 
			[tracedef := (self traceFailClause: reverseClone car car)
						cons: tracedef.
			tracedef := (self traceExitClause: reverseClone car)
						cons: tracedef.
			reverseClone cdr consp
				ifTrue: [tracedef := (self traceRedoClause: reverseClone car car)
								cons: tracedef]
				ifFalse: [tracedef := (self traceCallClause: reverseClone car car)
								cons: tracedef].
			reverseClone := reverseClone cdr].
	userPredicates at: aPrologSymbol put: (PrologDefinition fromList: tracedef).
	^true