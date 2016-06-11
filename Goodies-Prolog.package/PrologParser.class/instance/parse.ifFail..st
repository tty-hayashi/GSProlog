parsing
parse: sourceStream ifFail: aBlock
	| result |
	self init: sourceStream ifFail: aBlock.
	Cursor read showWhile: [result := self scan].
	^result