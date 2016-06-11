system predicates
clause: aPrologClause 
	| count horn def result |
	count := 0.
	horn := aPrologClause.
	horn consp
		ifFalse: 
			[horn := PrologStructure functor: horn terms: nil.
			count := count + 1].
	horn car consp
		ifFalse: 
			[horn := PrologClause head: horn body: nil.
			count := count + 1].
	horn := PrologClause head: horn car body: (PrologBody fromList: horn cdr).
	def := definitionStack car.
	[def consp]
		whileTrue: [(self
				unify: horn
				env: self nullEnv
				and: def car
				env: self nullEnv)
				ifTrue: 
					[result := def car.
					count timesRepeat: [result := result car].
					def := def cdr.
					definitionStack car: def.
					^result]
				ifFalse: 
					[def := def cdr.
					definitionStack car: def]].
	definitionStack := definitionStack cdr.
	^PrologSymbol cut