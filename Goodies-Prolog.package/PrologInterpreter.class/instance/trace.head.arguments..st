system support
trace: para head: head arguments: terms 
	| headString numberString structure arguString |
	headString := (self expression: head env: clauseEnv) printPrologString.
	para = 0
		ifTrue: 
			[traceCounter := traceCounter + 1.
			numberString := String new: traceCounter withAll: $|.
			structure := PrologStructure functor: head car terms: terms.
			arguString := (self expression: structure env: clauseEnv) printPrologString.
			headString := headString , ' ~ ' , arguString.
			textCollector show: numberString , ' CALL : ' , headString , '\' withCRs.
			^self].
	para = 1
		ifTrue: 
			[traceCounter := traceCounter + 1.
			numberString := String new: traceCounter withAll: $|.
			structure := PrologStructure functor: head car terms: terms.
			arguString := (self expression: structure env: clauseEnv) printPrologString.
			headString := headString , ' ~ ' , arguString.
			textCollector show: numberString , ' REDO : ' , headString , '\' withCRs.
			^self].
	para = 2
		ifTrue: 
			[numberString := String new: traceCounter withAll: $|.
			textCollector show: numberString , ' FAIL : ' , headString , '\' withCRs.
			traceCounter := traceCounter - 1.
			^self].
	para = 3
		ifTrue: 
			[numberString := String new: traceCounter withAll: $|.
			textCollector show: numberString , ' EXIT : ' , headString , '\' withCRs.
			^self]