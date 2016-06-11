adaptor
predListMenu: aMenu shifted: shifted 
	"PrologInterpreter flushMenus."
	^ aMenu
		labels: 'update'
		lines: #()
		selections: #(#updatePredList )