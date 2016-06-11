system predicates
tab: aNumber 
	| spaces |
	(aNumber isKindOf: Number)
		ifFalse: [^false].
	spaces := String new.
	aNumber asInteger timesRepeat: [spaces := spaces , ' '].
	textCollector show: spaces.
	^true