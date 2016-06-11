system support
systemReconsult: readStream 
	| condition newPredicates parser node hornClause program functor |
	condition := self getCondition.
	newPredicates := Dictionary new.
	parser := PrologParser new.
	[node := parser parse: readStream.
	node == #eof]
		whileFalse: 
			[hornClause := node cdr.
			node car
				ifTrue: [self resolve: hornClause]
				ifFalse: 
					[functor := hornClause car car.
					program := newPredicates at: functor ifAbsent: [].
					program == nil
						ifTrue: 
							[program := PrologDefinition fromList: (hornClause cons: nil).
							newPredicates at: functor put: program]
						ifFalse: [program nconc: (hornClause cons: nil)].
					systemPredicates at: functor put: program]].
	newPredicates keys do: [:eachPredicate | systemPredicates at: eachPredicate put: (newPredicates at: eachPredicate)].
	self putCondition: condition.
	^true