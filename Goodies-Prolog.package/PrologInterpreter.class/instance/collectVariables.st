representation
collectVariables
	| dict | 
	dict := Dictionary new.
	self collectVariables: question to: dict.
	^dict