system support
traceExitClause: exitClause
	| traceExitClause reverseClone| 
	traceExitClause := self traceExitClauseAux: exitClause car.
	traceExitClause := traceExitClause cdr.
	reverseClone := exitClause reverse.
	[reverseClone consp]
		whileTrue:
			[traceExitClause := reverseClone car cons: traceExitClause.
			reverseClone := reverseClone cdr].
	^PrologClause head: traceExitClause car body: (PrologBody fromList: traceExitClause cdr)