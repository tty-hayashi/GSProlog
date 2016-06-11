instance creation
fromList: aPrologDotPair 
	aPrologDotPair consp ifFalse: [^aPrologDotPair].
	^super new fromList: aPrologDotPair