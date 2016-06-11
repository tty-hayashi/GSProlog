private
init: sourceStream ifFail: aBlock 
	super on: sourceStream.
	failBlock := aBlock.
	PrologVariable setZero