system support
consult: readStream action: aBlock
	| condition parser node hornClause program functor stream result |
	condition := self getCondition.
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
					program := tracePredicates at: functor ifAbsent: [userPredicates at: functor ifAbsent: []].
					program == nil
						ifTrue: 
							[program := PrologDefinition fromList: (hornClause cons: nil).
							userPredicates at: functor put: program]
						ifFalse: [program nconc: (hornClause cons: nil)]]].
	self putCondition: condition.
	^result