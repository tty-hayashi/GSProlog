public accessing
refute: stringOrStream action: aBlock 
	| stream |
	(stringOrStream isKindOf: Stream)
		ifTrue: [stream := ReadStream on: stringOrStream contents]
		ifFalse: [stream := ReadStream on: stringOrStream].
	^self consult: stream action: aBlock