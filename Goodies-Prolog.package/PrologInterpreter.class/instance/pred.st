adaptor
pred
	"^ predicate"
	predicate isNil
		ifTrue: [^ 0].
	^ self predList indexOf: predicate string