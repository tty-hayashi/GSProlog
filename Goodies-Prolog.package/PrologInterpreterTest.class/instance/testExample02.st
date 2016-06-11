testing
testExample02
	| string prolog result predicates |
	string := '

	?- remove.	   % remove all predicates in PrologDataBase.
	on(hen,cat).
	on(cat,dog).
	on(dog,donkey).
	above(X,Y) :-
	    on(X,Y).
	above(X,Y) :-
	    on(X,Z), above(Z,Y).
	?- on(X,dog).
	?- above(X,dog).

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
		do: [:each | (each string = 'on' or: [each string = 'above'])
				ifTrue: [predicates add: each]].
	self assert: predicates isEmpty not.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates