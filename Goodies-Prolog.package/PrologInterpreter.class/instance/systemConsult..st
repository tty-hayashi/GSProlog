system support
systemConsult: readStream 
	| condition parser node hornClause program functor |
	condition := self getCondition.
	parser := PrologParser new.
	[node := parser parse: readStream.
	node == #eof]
		whileFalse: 
			[hornClause := node cdr.
			node car
				ifTrue: [self resolve: hornClause]
				ifFalse: 
					[functor := hornClause car car.
					program := systemPredicates at: functor ifAbsent: [].
					program == nil
						ifTrue: 
							[program := PrologDefinition fromList: (hornClause cons: nil).
							systemPredicates at: functor put: program]
						ifFalse: [program nconc: (hornClause cons: nil)]]].
	self putCondition: condition.
	^true