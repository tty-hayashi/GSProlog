*Goodies-Prolog-*prolog
printPrologString
	| aStream |
	aStream := WriteStream on: (String new: 20).
	self printPrologOn: aStream.
	^aStream contents