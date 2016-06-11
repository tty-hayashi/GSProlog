examples
example09
	"PrologInterpreter example09."
	| string anInterpreter result |
	string := '?- remove.
connect(entrance,a).
connect(a,b).
connect(a,h).
connect(b,a).
connect(b,c).
connect(b,i).
connect(c,b).
connect(c,j).
connect(d,e).
connect(d,k).
connect(e,d).
connect(e,f).
connect(f,e).
connect(f,g).
connect(f,m).
connect(g,f).
connect(h,a).
connect(h,i).
connect(h,o).
connect(i,b).
connect(i,h).
connect(i,j).
connect(j,c).
connect(j,k).
connect(j,q).
connect(j,i).
connect(k,d).
connect(k,j).
connect(k,l).
connect(k,r).
connect(m,f).
connect(m,n).
connect(m,t).
connect(n,m).
connect(o,h).
connect(p,w).
connect(q,j).
connect(r,k).
connect(r,y).
connect(s,t).
connect(s,z).
connect(t,m).
connect(t,s).
connect(t,u).
connect(u,t).
connect(v,w).
connect(v,exit).
connect(w,p).
connect(w,v).
connect(w,x).
connect(x,w).
connect(x,y).
connect(y,r).
connect(y,x).
connect(z,s).
connect(z,exit).
route(exit,P,R) :- 
	reverse(P,R).
route(X,P,R) :- 
	connect(X,Y), 
	not(member(Y,P)), 
	route(Y,[Y|P],R).
route(R) :- 
	route(entrance,[entrance],R).
?- clear.
?- route(X).'.
	anInterpreter := PrologInterpreter new.
	anInterpreter contents: string.
	anInterpreter open.
	result := anInterpreter 
		refute: string
		action: 
			[ :answer | 
			answer keys asSortedCollection do: 
				[ :s | 
				anInterpreter textCollector show: s.
				anInterpreter textCollector show: ' = '.
				anInterpreter textCollector show: (answer at: s) printPrologString.
				anInterpreter textCollector cr ].
			false ]