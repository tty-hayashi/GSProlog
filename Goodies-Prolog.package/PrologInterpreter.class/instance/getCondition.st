private
getCondition
	| condition |
	condition := Array new: 14.
	condition at: 1 put: status.
	condition at: 2 put: definition.
	condition at: 3 put: question.
	condition at: 4 put: questionEnv.
	condition at: 5 put: clause.
	condition at: 6 put: clauseEnv.
	condition at: 7 put: queue.
	condition at: 8 put: queueEnv.
	condition at: 9 put: valueEnv.
	condition at: 10 put: unbindList.
	condition at: 11 put: cutBack.
	condition at: 12 put: backTrack.
	condition at: 13 put: resolveAction.
	condition at: 14 put: definitionStack.
	^condition