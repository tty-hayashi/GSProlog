outputting
outputTime: msec 
	| goal string |
	verbose
		ifTrue: 
			[goal := envCounter - 1.
			string := '<'.
			string := string , msec printString , ' milliseconds, '.
			string := string , goal printString , ' goals'.
			string := string , '>\' withCRs.
			textCollector show: string asText]