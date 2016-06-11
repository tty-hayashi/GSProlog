kernel predicates
builtInSend
	| list receiverSymbol selectorSymbol argumentList unifyTerm result |
	list := self expression: clause car cdr env: clauseEnv.
	receiverSymbol := list car.
	list := list cdr.
	selectorSymbol := list car.
	list := list cdr.
	argumentList := list car.
	list := list cdr.
	list == nil
		ifTrue: [unifyTerm := nil]
		ifFalse: [list cdr == nil
				ifTrue: [unifyTerm := clause car cdr nth: 4]
				ifFalse: 
					[status := #back.
					^self]].
	result := self
				receiver: receiverSymbol
				selector: selectorSymbol
				arguments: argumentList.
	result = PrologSymbol cut
		ifTrue: 
			[self builtInCut.
			status := #back.
			^self].
	unifyTerm isNil
		ifTrue: 
			[result = false ifFalse: [result := true].
			result
				ifTrue: 
					[clause := clause cdr.
					status := #loop.
					^self]
				ifFalse: 
					[status := #back.
					^self]]
		ifFalse: [(self
				unify: unifyTerm
				env: clauseEnv
				and: result
				env: self nullEnv)
				ifTrue: 
					[clause := clause cdr.
					status := #loop.
					^self]
				ifFalse: 
					[status := #back.
					^self]].
	^self