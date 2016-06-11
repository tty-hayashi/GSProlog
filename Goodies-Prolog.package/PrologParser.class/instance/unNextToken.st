scanning
unNextToken
	super unNextToken.
	mark := prevMark.
	token := prevToken.
	tokenType := prevTokenType