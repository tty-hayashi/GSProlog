testing
testExample01
	| string prolog result predicates |
	string := '

	?- remove.	   % remove all predicates in PrologDataBase.
	likes(john,mary).    % assert fact.
	likes(john,wine).    % assert fact.
	likes(mary,wine).    % assert fact.
	likes(mary,john).    % assert fact.
	?- likes(X,Y).		   % question goal.
	?- likes(john,X), likes(mary,X). % question goal.

	'.
	prolog := PrologInterpreter new.
	result := prolog
				refute: string
				action: [:answer | 
					answer keys asSortedCollection
						do: [:s | ].
					true].
	self assert: result = true.
	predicates := OrderedCollection new.
	prolog userPredicates
		do: [:each | each string = 'likes'
				ifTrue: [predicates add: each]].
	self assert: predicates isEmpty not.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates