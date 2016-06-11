system predicates
functorArityOf: aPrologStructure 
	aPrologStructure isNil ifTrue: [^nil cons: 0].
	(self number: aPrologStructure)
		ifTrue: [^aPrologStructure cons: 0].
	(aPrologStructure respondsTo: #functor)
		ifFalse: [^nil].
	^aPrologStructure functor cons: aPrologStructure arity