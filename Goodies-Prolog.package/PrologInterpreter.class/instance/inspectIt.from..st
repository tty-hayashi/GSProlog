menu messages
inspectIt: aText from: aController 
	| result stream |
	self acceptWith: aText.
	"see BrowserView browseFullForClass: PluggableStringHolderController method: #sendMenuMessageToModel:."
	stream := ReadStream on: aText asString.
	self consult: stream
		action: 
			[:dict | 
			result := dict.
			self outputVariables: dict].
	result inspect.
	^result