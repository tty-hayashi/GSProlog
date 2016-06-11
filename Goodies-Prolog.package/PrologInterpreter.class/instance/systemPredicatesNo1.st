private
systemPredicatesNo1
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		repeat.
		repeat :- repeat.
		nonvar(X) :- var(X), !, fail.
		nonvar(X).
		integer(X) :- send(self,integer:,[X]).
		float(X) :- send(self,float:,[X]).
		double(X) :- send(self,double:,[X]).
		fraction(X) :- send(self,fraction:,[X]).
		number(X) :- send(self,number:,[X]).
		symbol(X) :- send(self,symbol:,[X]).
		string(X) :- send(self,string:,[X]).
		list(X) :- send(self,list:,[X]).
		dotp(X) :- send(self,dotp:,[X]).
		atom(X) :- symbol(X).
		atom(X) :- nonvar(X), =(X,[]).
		atom(X) :- string(X).
		atomic(X) :- atom(X).
		atomic(X) :- number(X).
		structure(X) :- nonvar(X), not(atomic(X)).
	')