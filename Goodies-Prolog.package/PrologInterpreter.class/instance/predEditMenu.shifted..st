adaptor
predEditMenu: aMenu shifted: shifted 
	"PrologInterpreter flushMenus."
	^ aMenu
		labels: ('save\remove\update' withCRs findTokens: String cr asArray)
		lines: #()
		selections: #(#savePred #removePred #updatePredList )