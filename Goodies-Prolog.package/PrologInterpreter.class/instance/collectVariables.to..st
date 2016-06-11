representation
collectVariables: x to: dict
	| key value |  
	(x isPrologVariable and: [(x at: 1) ~= $~])
		ifTrue:
			[key := String fromString: x printPrologString.
			(dict at: key ifAbsent: []) ~~ nil
				ifTrue: [^self]
				ifFalse: 
					[value := self represent: x env: questionEnv.
					dict at: key put: value]].
	(x consp)
		ifFalse: [^self].
	self collectVariables: x car to: dict.
	self collectVariables: x cdr to: dict