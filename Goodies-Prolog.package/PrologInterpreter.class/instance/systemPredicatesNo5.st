private
systemPredicatesNo5
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		call(G) :- G.
		not(G) :- G, !, fail.
		not(G).
		or(X,Y) :- call(X).
		or(X,Y) :- call(Y).
		and(X,Y) :- call(X), call(Y).
	')