system predicates
univ: aPrologList 
	| termv listv termValue termEnv listVal listEnv |
	termv := PrologVariable install: aPrologList car string.
	listv := PrologVariable install: aPrologList cdr string.
	termValue := self fetchValue: termv env: clauseEnv.
	termEnv := valueEnv.
	listVal := self fetchValue: listv env: clauseEnv.
	listEnv := valueEnv.
	termValue isPrologVariable
		ifTrue: 
			["construct a term from fixed length list."
			| functor functorEnv terms newterms newStruct |
			listVal isPrologVariable ifTrue: [^false].
			listVal consp ifFalse: [^false].
			functor := self fetchValue: listVal car env: listEnv.
			functorEnv := valueEnv.
			terms := self fetchValue: listVal cdr env: listEnv.
			listEnv := valueEnv.
			(self number: functor)
				ifTrue: 
					[terms isNil ifFalse: [^false].
					self
						bind: termValue
						env: termEnv
						and: functor
						env: listEnv.
					^true].
			functor consp ifTrue: ["It's a structure or a list"
				^false].
			terms isNil
				ifTrue: 
					[self
						bind: termValue
						env: termEnv
						and: functor
						env: functorEnv.
					^true].
			terms consp ifFalse: ["Not a list, but an illegal dot pair."
				^false].
			newterms := nil.
			[terms isNil]
				whileFalse: 
					[| car t |
					car := terms car.
					terms := self fetchValue: terms cdr env: listEnv.
					terms isPrologVariable ifTrue: ["The length of the list has not been fixed yet."
						^false].
					t := PrologTerms car: car cdr: nil.
					newterms isNil
						ifTrue: [newterms := t]
						ifFalse: [newterms := newterms nconc: t]].
			newStruct := PrologStructure functor: functor terms: newterms.
			^self
				unify: termValue
				env: termEnv
				and: newStruct
				env: listEnv]
		ifFalse: 
			["disasemble a term into a list"
			| list |
			termValue consp
				ifTrue: ["It's a list or a structure."
					list := termValue structureList]
				ifFalse: ["primitive data like symbol, number, nil, or string."
					list := termValue cons: nil].
			^self
				unify: list
				env: termEnv
				and: listVal
				env: listEnv]