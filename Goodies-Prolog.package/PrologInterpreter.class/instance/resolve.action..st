resolution
resolve: goal action: actionBlock
	| result |
	question := clause := goal.
	actionBlock == nil
		ifTrue: [resolveAction := [:dict | self outputVariables: dict]]
		ifFalse: [resolveAction := actionBlock].
	Cursor execute
		showWhile: 
			[self resolveInitialize.
			self resolveLoop.
			result := self resolveTerminate].
	^result