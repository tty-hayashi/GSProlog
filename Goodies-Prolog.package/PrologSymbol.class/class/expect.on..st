private
expect: aString on: aStream
	"If aStream contains aString at the current position, then return true and set the position of aStream to the next char of the string.
	else return false and rewind the position."

	| pos string |
	pos := aStream position.
	string := String new.
	aString size timesRepeat: [
		aStream atEnd ifFalse: [string := string , (String with: aStream next)]].
	aString = string
		ifTrue: [^true]
		ifFalse: [
			aStream position: pos.
			^false]