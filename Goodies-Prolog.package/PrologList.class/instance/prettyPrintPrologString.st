printing
prettyPrintPrologString
	| aStream |
	aStream := WriteStream on: (String new: 20).
	self prettyPrintPrologOn: aStream.
	^aStream contents