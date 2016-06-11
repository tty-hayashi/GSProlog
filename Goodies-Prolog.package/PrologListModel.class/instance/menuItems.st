private
menuItems
	| collection |
	collection := OrderedCollection new.
	collection add: 'update' -> #update.
	collection add: 'update:' -> #update:.
	collection add: 'update:with:' -> #update:with:.
	collection add: 'update:with:with:' -> #update:with:with:.
	^ collection