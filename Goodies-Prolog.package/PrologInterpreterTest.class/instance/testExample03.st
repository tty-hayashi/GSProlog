testing
testExample03
	| string prolog result predicates |
	string := '

	?- remove.	% remove all predicates in PrologDataBase.
	hanoi(N) :-	% This is Hanoi Tower Prolgram.
	    move(N,left,right,center).
	    move(0,X,Y,Z) :- !.
	move(N,A,B,C) :-
	    -(N,1,M),
	    move(M,A,C,B),
	    inform(A,B),
	    move(M,C,B,A).
	inform(X,Y) :-
	    write([move,disc,from,X,to,Y]),
	    nl.
	?- hanoi(3).	 % question goal.

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
		do: [:each | (each string = 'move' or: [each string = 'hanoi'])
				ifTrue: [predicates add: each]].
	self assert: predicates isEmpty not.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates