functions
append: aPrologDotPair 
	(cdrPart consp)
		ifFalse: [^carPart cons: aPrologDotPair].
	^carPart cons: (cdrPart append: aPrologDotPair)