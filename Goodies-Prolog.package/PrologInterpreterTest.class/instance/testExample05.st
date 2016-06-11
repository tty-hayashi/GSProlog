testing
testExample05
	| string prolog result predicates |
	string := '

	image({Form extent: 100 @ 100}).
	graphicsContext({Display}).
	point({100@100}).
	?- image(X), graphicsContext(Y), point(Z), send(X,displayOn:at:,[Y,Z]).

	'.
	prolog := PrologInterpreter new.
	result := prolog
				refute: string
				action: [:answer | 
					answer keys asSortedCollection
						do: [:s | s].
					true].
	World restoreMorphicDisplay.
	self assert: result = true.
	predicates := OrderedCollection new.
	prolog userPredicates
		do: [:each | ((each string = 'graphicsContext'
						or: [each string = 'image'])
					or: [each string = 'point'])
				ifTrue: [predicates add: each]].
	self assert: predicates isEmpty not.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates