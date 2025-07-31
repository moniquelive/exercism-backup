Extension { #name : #Integer }

{ #category : #'*Exercise@Die' }
Integer >> d10 [

	^ DieHandle new
		  addDice: ((1 to: self) collect: [ :_ | Die withFaces: 10 ]);
		  yourself
]

{ #category : #'*Exercise@Die' }
Integer >> d20 [

	^ DieHandle new
		  addDice: ((1 to: self) collect: [:_| Die withFaces: 20 ]);
		  yourself
]
