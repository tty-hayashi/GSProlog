adaptor
pred: index 
	(index isNil
			or: [index isInteger not])
		ifTrue: [predicate := nil]
		ifFalse: [| selection | 
			(selection := self predList at: index ifAbsent: nil) isNil
				ifFalse: [
			predicate := PrologSymbol install: selection]].
	textValue := self listingText.
	self changed: #pred.
	self changed: #listingText.
	self changed: #editingText