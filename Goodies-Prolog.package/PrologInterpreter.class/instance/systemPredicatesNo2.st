private
systemPredicatesNo2
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		==(X,Y) :- send(X,=,[Y]).
		\==(X,Y) :- ==(X,Y), !, fail.
		\==(X,Y).
		=(X,X).
		\=(X,Y) :- =(X,Y), !, fail.
		\=(X,Y).
		>(X,Y) :- send(X,>,[Y]).
		>=(X,Y) :- send(X,>=,[Y]).
		<(X,Y) :- send(X,<,[Y]).
		=<(X,Y) :- send(X,<=,[Y]).
	')