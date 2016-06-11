private
acceptWith: aText
	"force to regist aText as a contents."

	self contents: aText.
	textValue := aText.
	self changed: #clearUserEdits.
	^ true