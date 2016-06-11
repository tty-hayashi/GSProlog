adaptor
editingText
	| stream def |
	predicate == nil ifTrue: [^Text new].
	stream := WriteStream on: (String new: 200).
	def := userPredicates at: predicate ifAbsent: [^Text new].
	[def consp]
		whileTrue: 
			[def car prettyPrintPrologOn: stream.
			stream cr.
			def := def cdr].
	^stream contents asText