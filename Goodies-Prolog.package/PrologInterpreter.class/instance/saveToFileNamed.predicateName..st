system support
saveToFileNamed: fileName predicateName: aPrologSymbol 
	| aFileStream |
	aFileStream := FileStream fileNamed: fileName.
	
	[ self 
		saveOn: aFileStream
		predicateName: aPrologSymbol ] ensure: [ aFileStream close ]