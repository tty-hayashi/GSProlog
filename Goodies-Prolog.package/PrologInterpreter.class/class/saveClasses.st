saving
saveClasses
	"PrologInterpreter saveClasses."
	| patternCollection classCollection string something |
	patternCollection := #('Prolog*' ).
	classCollection := SystemOrganization superclassOrder: self category.
	classCollection addAll: (SystemOrganization superclassOrder: 'Goodies-Prolog-Test').
	classCollection := Class superclassOrder: classCollection.
	classCollection := classCollection
				select: [:aClass | 
					string := aClass name asString.
					something := patternCollection
								detect: [:it | it match: string]
								ifNone: [].
					something notNil].
	^ classCollection