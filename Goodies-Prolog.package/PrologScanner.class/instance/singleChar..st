scanning
singleChar: type 
	self nextChar.
	token := type.
	tokenType == #leftBrace ifFalse: [^self].
	tokenType := #object.
	token := PrologObject readFrom: source