scan
scanExpression
	| symbol |
	self nextToken.
	(tokenType == #eof or: [tokenType == #period])
		ifTrue: [^nil].
	tokenType == #number ifTrue: [^token].
	tokenType == #string ifTrue: [^token].
	tokenType == #object ifTrue: [^PrologObject source: token object: (self compileAndEvaluate: token)].
	tokenType == #leftBracket ifTrue: [^self scanList].
	tokenType == #leftParenthesis ifTrue: [^self scanClause].
	(tokenType == #symbol or: [tokenType == #variable])
		ifTrue: 
			[symbol := token.
			self nextToken.
			tokenType == #leftParenthesis
				ifTrue: 
					[self unNextToken.
					self unNextToken.
					^self scanStructure]
				ifFalse: 
					[self unNextToken.
					^symbol]].
	self unNextToken.
	failBlock value: 'Syntax error'