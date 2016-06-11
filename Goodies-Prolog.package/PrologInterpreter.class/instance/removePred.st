menu messages
removePred
	predicate == nil ifTrue: [^self].
	(self confirm: 'Do you really want to remove?')
		ifTrue: 
			[self remove: predicate.
			self updatePredList]