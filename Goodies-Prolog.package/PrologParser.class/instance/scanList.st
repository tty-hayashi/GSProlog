scan
scanList
	| expression |
	self nextToken.
	tokenType == #comma ifTrue: [self nextToken].
	tokenType == #neck ifTrue: [self nextToken].
	tokenType == #rightBracket ifTrue: [^nil].
	tokenType == #leftBracket ifTrue: [^self scanList cons: self scanList].
	tokenType == #verticalBar
		ifTrue: 
			[expression := self scanExpression.
			self nextToken.
			tokenType == #rightBracket
				ifTrue: [^expression]
				ifFalse: [failBlock value: 'Syntax error']].
	self unNextToken.
	expression := self scanExpression.
	^expression cons: self scanList