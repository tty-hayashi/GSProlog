scan
scan
	source atEnd ifTrue: [^#eof].
	self nextToken.
	tokenType == #eof ifTrue: [^#eof].
	tokenType == #neck ifTrue: [^true cons: self scanClause]. "resolve clause"
	self unNextToken.
	^false cons: self scanClause "assert clause"