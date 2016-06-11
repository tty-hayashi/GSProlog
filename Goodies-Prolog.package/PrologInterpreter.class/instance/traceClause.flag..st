system support
traceClause: head flag: anInteger 
	| arguVar headStruct failStruct traceStruct |
	arguVar := PrologVariable install: 'Arguments'.
	headStruct := PrologStructure functor: head car terms: arguVar.
	failStruct := PrologStructure functor: (PrologSymbol install: 'fail')
				terms: nil.
	traceStruct := arguVar cons: nil.
	traceStruct := head cons: traceStruct.
	traceStruct := anInteger cons: traceStruct.
	traceStruct := traceStruct cons: nil.
	traceStruct := (PrologSymbol install: 'trace:head:arguments:')
				cons: traceStruct.
	traceStruct := (PrologSymbol install: 'self')
				cons: traceStruct.
	traceStruct := PrologTerms fromList: traceStruct.
	traceStruct := PrologStructure functor: (PrologSymbol install: 'send')
				terms: traceStruct.
	anInteger = 3 ifTrue: [^PrologClause head: headStruct body: (PrologBody fromList: (traceStruct cons: nil))].
	^PrologClause head: headStruct body: (PrologBody fromList: (traceStruct cons: (failStruct cons: nil)))