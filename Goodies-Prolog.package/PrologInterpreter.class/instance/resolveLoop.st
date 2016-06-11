resolution
resolveLoop
	| totalTime time answer |
	totalTime := 0.
	time := Time millisecondClockValue.
	[true]
		whileTrue: 
			[status == #loop ifTrue: [self loop].
			status == #next ifTrue: [self next].
			status == #back ifTrue: [self back].
			status == #succ
				ifTrue: 
					[time := Time millisecondClockValue - time.
					self outputTime: (totalTime := totalTime + time).
					answer := self collectVariables.
					answer isEmpty ifTrue: [^true].
					(resolveAction value: answer)
						ifTrue: [^true]
						ifFalse: 
							[status := #back.
							time := Time millisecondClockValue]].
			status == #fail
				ifTrue: 
					[time := Time millisecondClockValue - time.
					self outputTime: (totalTime := totalTime + time).
					^false]]