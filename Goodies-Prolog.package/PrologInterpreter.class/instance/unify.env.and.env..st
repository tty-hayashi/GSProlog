unification
unify: x env: xEnv and: y env: yEnv 
	| xx yy assoc |
	xx := x.
	yy := y.
	[true]
		whileTrue: 
			[xEnv == yEnv ifTrue: [x = y ifTrue: [^true]].
			xx isPrologVariable ifTrue: [(assoc := self binding: xx env: xEnv) ~~ nil
					ifTrue: 
						[valueEnv := xEnv.
						assoc := assoc cdr.
						xx := self fetchValue: assoc car env: assoc cdr.
						^self
							unify: xx
							env: valueEnv
							and: yy
							env: yEnv]
					ifFalse: 
						[yy isPrologVariable ifTrue: [(assoc := self binding: yy env: yEnv) ~~ nil
								ifTrue: 
									[valueEnv := yEnv.
									assoc := assoc cdr.
									yy := self fetchValue: assoc car env: assoc cdr.
									^self
										unify: xx
										env: xEnv
										and: yy
										env: valueEnv]].
						self
							bind: xx
							env: xEnv
							and: yy
							env: yEnv.
						^true]].
			yy isPrologVariable
				ifTrue: 
					[(assoc := self binding: yy env: yEnv) ~~ nil
						ifTrue: 
							[valueEnv := yEnv.
							assoc := assoc cdr.
							yy := self fetchValue: assoc car env: assoc cdr.
							^self
								unify: xx
								env: xEnv
								and: yy
								env: valueEnv].
					self
						bind: yy
						env: yEnv
						and: xx
						env: xEnv.
					^true].
			xx consp ifFalse: [^xx = yy].
			yy consp ifFalse: [^yy = xx].
			(self
				unify: xx car
				env: xEnv
				and: yy car
				env: yEnv)
				ifFalse: [^false].
			xx := xx cdr.
			yy := yy cdr]