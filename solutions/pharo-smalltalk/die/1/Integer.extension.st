Extension { #name : #Integer }

{ #category : #'*Exercise@Die' }
Integer >> d10 [

	| h |
	h := DieHandle new.
	self timesRepeat: [ h addDie: (Die withFaces: 10) ].
	^ h
]

{ #category : #'*Exercise@Die' }
Integer >> d20 [

	| h |
	h := DieHandle new.
	self timesRepeat: [ h addDie: (Die withFaces: 20) ].
	^ h
]
