scan
scanBody
	| list |
	list := nil.
	[tokenType ~~ #eof]
		whileTrue: 
			[list := self scanStructure cons: list.
			self nextToken.
			tokenType == #rightParenthesis ifTrue: [^PrologBody fromReverseList: list].
			tokenType == #period ifTrue: [^PrologBody fromReverseList: list].
			tokenType ~~ #comma ifTrue: [failBlock value: 'Syntax error']].
	failBlock value: 'Unexpected eof'