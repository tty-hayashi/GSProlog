menu messages
update: selectedString with: wholeString with: aController
	Transcript cr; show: thisContext printString.
	Transcript cr; tab; show: 'selection is ' , self selection printString.
	Transcript cr; tab; show: '1st argument is ' , selectedString printString.
	Transcript cr; tab; show: '2nd argument is ' , wholeString printString.
	Transcript cr; tab; show: '3rd argument is ' , aController printString