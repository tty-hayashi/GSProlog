scan
scanClause
	| head |
	head := self scanStructure.
	self nextToken.
	tokenType == #neck ifTrue: [^PrologClause head: head body: self scanBody].
	tokenType == #comma ifTrue: [^PrologClause head: head body: self scanBody].
	tokenType == #period ifTrue: [^PrologClause head: head body: nil].
	tokenType == #rightParenthesis ifTrue: [^PrologClause head: head body: nil].
	self unNextToken.
	failBlock value: 'Syntax error'