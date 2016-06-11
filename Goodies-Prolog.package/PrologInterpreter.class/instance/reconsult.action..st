system support
reconsult: readStream action: aBlock
	| condition newPredicates parser node hornClause program functor stream result |
	condition := self getCondition.
	newPredicates := Dictionary new.
	parser := PrologParser new.
	result := true.
	[node := parser parse: readStream.
	node == #eof]
		whileFalse: 
			[hornClause := node cdr.
			node car
				ifTrue: 
					[stream := WriteStream on: (String new: 20).
					hornClause questionPrintPrologOn: stream.
					textCollector show: stream contents.
					textCollector cr.
					result := self resolve: hornClause action: aBlock]
				ifFalse: 
					[functor := hornClause car car.
					program := newPredicates at: functor ifAbsent: [].
					program == nil
						ifTrue: 
							[program := PrologDefinition fromList: (hornClause cons: nil).
							newPredicates at: functor put: program]
						ifFalse: [program nconc: (hornClause cons: nil)].
					userPredicates at: functor put: program]].
	newPredicates keys
		do: [:eachPredicate |
			userPredicates at: eachPredicate put: (newPredicates at: eachPredicate).
			tracePredicates removeKey: eachPredicate ifAbsent: []].
	self putCondition: condition.
	^result