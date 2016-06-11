menu messages
update: selectedString
	Transcript cr; show: thisContext printString.
	Transcript cr; tab; show: 'selection is ' , self selection printString.
	Transcript cr; tab; show: '1st argument is ' , selectedString printString