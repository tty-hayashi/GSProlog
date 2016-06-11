outputting
outputVariables: aDictionary
	| bool |
	self outputAnswer: aDictionary.
	bool := self confirm: 'All right ?'.
	bool
		ifTrue: [textCollector cr]
		ifFalse: [textCollector show: ';\' withCRs].
	^bool