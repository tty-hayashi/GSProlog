resolution
resolveTerminate
	Cursor wait
		showWhile: 
			[self deallocateEnv: questionEnv].
	status == #succ
		ifTrue: 
			[textCollector show: 'yes'.
			textCollector cr.
			^true].
	status == #fail
		ifTrue: 
			[textCollector show: 'no'.
			textCollector cr.
			^false].
	self error: 'Unexpected status'