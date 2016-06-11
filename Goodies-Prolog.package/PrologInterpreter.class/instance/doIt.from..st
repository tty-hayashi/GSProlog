menu messages
doIt: aText from: aController 
	| stream |
	self acceptWith: aText.
	stream := ReadStream on: aText asString.
	self consult: stream action: nil.
	self pred: 0.
	self changed: #predList