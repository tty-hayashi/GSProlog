private
systemPredicatesNo8
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		append([],X,X).
		append([A|X],Y,[A|Z]) :- append(X,Y,Z).
		member(X,[X|Y]).
		member(X,[Y|Z]) :- member(X,Z).
		reverse([],[]).
		reverse([H|T],L) :- reverse(T,Z), append(Z,[H],L).
		length(X,Y) :- send(self,length:,[X],Y).
		nth([X|Y],1,Z) :- !, =(X,Z).
		nth([X|Y],N,Z) :- -(N,1,PN), nth(Y,PN,Z).
		printlist(L) :- send(self,listPrint:,[L]).
		lispAppend(X,Y,Z) :- send(X,append:,[Y],Z).
		lispReverse(X,Y) :- send(X,reverse,[],Y).
		lispMember(X,Y) :- send(Y,member:,[X],A), \=(A,[]).
		lispMember(X,Y,Z) :- send(Y,member:,[X],Z).
		lispAssoc(X,Y) :- send(Y,assoc:,[X],A), \=(A,[]).
		lispAssoc(X,Y,Z) :- send(Y,assoc:,[X],Z).
		lispNconc(X,Y,Z) :- send(X,nconc:,[Y],Z).
	')