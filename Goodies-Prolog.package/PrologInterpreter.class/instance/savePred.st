menu messages
savePred
	predicate == nil ifTrue: [^self].
	self saving: predicate