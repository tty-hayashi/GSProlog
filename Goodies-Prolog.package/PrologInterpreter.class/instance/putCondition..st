private
putCondition: condition 
	status := condition at: 1.
	definition := condition at: 2.
	question := condition at: 3.
	questionEnv := condition at: 4.
	clause := condition at: 5.
	clauseEnv := condition at: 6.
	queue := condition at: 7.
	queueEnv := condition at: 8.
	valueEnv := condition at: 9.
	unbindList := condition at: 10.
	cutBack := condition at: 11.
	backTrack := condition at: 12.
	resolveAction := condition at: 13.
	definitionStack := condition at: 14