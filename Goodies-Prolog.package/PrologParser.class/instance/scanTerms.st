scan
scanTerms
	| list |
	self nextToken.
	tokenType == #leftParenthesis
		ifTrue: 
			[self nextToken.
			(tokenType == #verticalBar or: [tokenType == #rightParenthesis])
				ifTrue:
					[tokenType == #rightParenthesis
						ifTrue: [^nil].
					list := self scanExpression.
					self nextToken.
					tokenType == #rightParenthesis
						ifTrue: [^list]
						ifFalse: [failBlock value: 'Syntax error']]
				ifFalse: [self unNextToken].
			list := nil.
			[tokenType ~~ #eof]
				whileTrue: 
					[list := self scanExpression cons: list.
					self nextToken.
					token == #rightParenthesis ifTrue: [^PrologTerms fromReverseList: list].
					tokenType == #verticalBar
						ifTrue:
							[list := list reverse.
							list := list nconc: self scanExpression.
							self nextToken.
							tokenType == #rightParenthesis
								ifTrue: [^PrologTerms fromList: list]
								ifFalse: [failBlock value: 'Syntax error']].
					tokenType ~~ #comma ifTrue: [failBlock value: 'Syntax error']].
			failBlock value: 'Unexpected eof']
		ifFalse: 
			[self unNextToken.
			^nil]