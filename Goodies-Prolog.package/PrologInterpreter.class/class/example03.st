examples
example03
	"PrologInterpreter example03."

	| string prolog result |
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
	prolog textCollector: Transcript.
	result := prolog refute: string
				action: 
					[:answer | 
					answer keys asSortedCollection
						do: 
							[:s | 
							Transcript show: s.
							Transcript show: ' = '.
							Transcript show: (answer at: s) printPrologString.
							Transcript cr].
					prolog confirm: 'All right?'].
	Transcript show: result printString; cr