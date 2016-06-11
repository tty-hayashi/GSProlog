private
systemPredicatesNo3
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		+(X,Y,Z) :- send(X,+,[Y],Z).
		-(X,Y,Z) :- send(X,-,[Y],Z).
		*(X,Y,Z) :- send(X,*,[Y],Z).
		//(X,Y,Z) :- send(X,//,[Y],Z).
		/(X,Y,Z) :- send(X,/,[Y],Z).
		\\(X,Y,Z) :- send(X,\\,[Y],Z).
		is(Z,+(X,Y)) :- nonvar(Z), nonvar(X), nonvar(Y), send(X,+,[Y],Z).
		is(Z,+(X,Y)) :- var(Z), nonvar(X), nonvar(Y), send(X,+,[Y],Z).
		is(Z,+(X,Y)) :- var(X), nonvar(Y), nonvar(Z), send(Z,-,[Y],X).
		is(Z,+(X,Y)) :- var(Y), nonvar(Z), nonvar(X), send(Z,-,[X],Y).
		is(Z,-(X,Y)) :- nonvar(Z), nonvar(X), nonvar(Y), send(X,-,[Y],Z).
		is(Z,-(X,Y)) :- var(Z), nonvar(X), nonvar(Y), send(X,-,[Y],Z).
		is(Z,-(X,Y)) :- var(X), nonvar(Y), nonvar(Z), send(Z,+,[Y],X).
		is(Z,-(X,Y)) :- var(Y), nonvar(Z), nonvar(X), send(X,-,[Z],Y).
		is(Z,*(X,Y)) :- nonvar(Z), nonvar(X), nonvar(Y), send(X,*,[Y],Z).
		is(Z,*(X,Y)) :- var(Z), nonvar(X), nonvar(Y), send(X,*,[Y],Z).
		is(Z,*(X,Y)) :- var(X), nonvar(Y), nonvar(Z), send(Z,/,[Y],X).
		is(Z,*(X,Y)) :- var(Y), nonvar(Z), nonvar(X), send(Z,/,[X],Y).
		is(Z,/(X,Y)) :- nonvar(Z), nonvar(X), nonvar(Y), send(X,/,[Y],Z).
		is(Z,/(X,Y)) :- var(Z), nonvar(X), nonvar(Y), send(X,/,[Y],Z).
		is(Z,/(X,Y)) :- var(X), nonvar(Y), nonvar(Z), send(Z,*,[Y],X).
		is(Z,/(X,Y)) :- var(Y), nonvar(Z), nonvar(X), send(X,/,[Z],Y).
		is(X,Y) :- =(X,Y).
	')