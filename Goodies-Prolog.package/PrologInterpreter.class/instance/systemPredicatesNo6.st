private
systemPredicatesNo6
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		read(X) :- send(self,read,[],X).
		read(X,M) :- send(self,read:,[M],X).
		write(X) :- send(self,write:,[X]).
		nl :- send(self,nl,[]).
		tab(X) :- number(X), send(self,tab:,[X]).
		clear :- send(self,clear,[]).
	')