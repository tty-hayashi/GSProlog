system predicates
read: aMessage 
	| answer parser stream |
	answer :=  UIManager default  request: aMessage initialAnswer: String new.
	parser := PrologParser new.
	stream := ReadStream on: answer asString.
	parser init: stream ifFail: [:errorMessage | ^self error: errorMessage].
	^parser scanExpression