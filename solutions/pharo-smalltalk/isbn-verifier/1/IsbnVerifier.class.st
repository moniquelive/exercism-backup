Class {
	#name : #IsbnVerifier,
	#superclass : #Object,
	#category : #'Exercise@IsbnVerifier'
}

{ #category : #testing }
IsbnVerifier >> isValidIsbn: isbn [

	| digits |
	((RxMatcher forString: '\d-?\d{3}-?\d{5}-?[\dX]') matches: isbn) 
		ifFalse: [ ^ false ].

	digits := (isbn reject: [ :each | each == $- ])
		          collect: [ :each | 
			          each = $X
				          ifTrue: 10
				          ifFalse: each digitValue ]
		          into: OrderedCollection new.

	digits := (digits
		           with: #(10 9 8 7 6 5 4 3 2 1)
		           collect: [ :digit :factor | digit * factor ]) sum.

	^ digits \\ 11 = 0
]
