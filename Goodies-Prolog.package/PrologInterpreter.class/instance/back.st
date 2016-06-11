resolve modules
back
	| array |
	backTrack == nil
		ifTrue: 
			[status := #fail.
			^self].
	array := backTrack car.
	backTrack := backTrack cdr.
	clause := array at: 1.
	clauseEnv := array at: 2.
	queue := array at: 3.
	queueEnv := array at: 4.
	cutBack := array at: 5.
	definition := array at: 6.
	array := array at: 7.
	self unbindFrom: unbindList to: array.
	unbindList := array.
	status := #next