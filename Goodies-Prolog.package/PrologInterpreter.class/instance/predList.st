adaptor
predList
	| collection |
	collection := OrderedCollection new.
	userPredicates associationsDo: [:assoc | collection add: assoc key string].
	collection := collection asSortedCollection.
	^collection asArray