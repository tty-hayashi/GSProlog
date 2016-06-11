resolution
resolveInitialize
	status := #loop.
	envCounter := 0.
	questionEnv := clauseEnv := self nullEnv.
	queue := queueEnv := valueEnv := nil.
	unbindList := cutBack := backTrack := nil.
	definitionStack := nil.
	traceCounter := 0