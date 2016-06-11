resolve modules
next
	| definitionEnv saveBackTrack array |
	definitionEnv := self nullEnv.
	definition cdr == nil
		ifTrue: 
			[(self
				unify: clause car cdr
				env: clauseEnv
				and: definition car car cdr
				env: definitionEnv)
				ifFalse: 
					[status := #back.
					^self].
			queue := clause cdr cons: queue.
			queueEnv := clauseEnv cons: queueEnv.
			clause := definition car cdr.
			clauseEnv := definitionEnv.
			cutBack := backTrack cons: cutBack.
			status := #loop.
			^self].
	saveBackTrack := backTrack.
	array := Array new: 7.
	array at: 1 put: clause.
	array at: 2 put: clauseEnv.
	array at: 3 put: queue.
	array at: 4 put: queueEnv.
	array at: 5 put: cutBack.
	array at: 6 put: definition cdr.
	array at: 7 put: unbindList.
	backTrack := array cons: saveBackTrack.
	(self
		unify: clause car cdr
		env: clauseEnv
		and: definition car car cdr
		env: definitionEnv)
		ifFalse: 
			[status := #back.
			^self].
	queue := clause cdr cons: queue.
	queueEnv := clauseEnv cons: queueEnv.
	clause := definition car cdr.
	clauseEnv := definitionEnv.
	cutBack := saveBackTrack cons: cutBack.
	status := #loop