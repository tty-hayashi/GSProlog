instance creation
fromReverseList: aPrologDotPair 
	aPrologDotPair consp ifFalse: [^aPrologDotPair].
	^super new fromReverseList: aPrologDotPair