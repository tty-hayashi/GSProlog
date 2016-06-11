system support
saveToFileNamed: fileName 
	| aFileStream |
	aFileStream := FileStream fileNamed: fileName.
	[ self saveOn: aFileStream ] ensure: [ aFileStream close ]