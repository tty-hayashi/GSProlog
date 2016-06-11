binding and unbinding
bind: x env: xEnv and: y env: yEnv 
	| list |
	list := (self fetchValue: y env: yEnv) cons: valueEnv.
	list := (x cons: list) cons: xEnv cdr. 
	xEnv cdr: list. 
	unbindList := xEnv cons: unbindList