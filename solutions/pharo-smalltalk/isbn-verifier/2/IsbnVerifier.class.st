Class {
	#name : 'IsbnVerifier',
	#superclass : 'Object',
	#instVars : [
		'regexp'
	],
	#category : 'Exercise@IsbnVerifier',
	#package : 'Exercise@IsbnVerifier'
}

{ #category : 'initialization' }
IsbnVerifier >> initialize [

	super initialize.
	regexp := RxMatcher forString: '\d-?\d{3}-?\d{5}-?[\dX]'
]

{ #category : 'testing' }
IsbnVerifier >> isValidIsbn: isbn [

	| digits |
	(regexp matches: isbn) ifFalse: [ ^ false ].

	digits := (isbn reject: [ :each | each == $- ])
		          collect: [ :each |
			          each = $X
				          ifTrue: [ 10 ]
				          ifFalse: [ each digitValue ] ]
		          into: OrderedCollection new.

	digits := (digits
		           with: #( 10 9 8 7 6 5 4 3 2 1 )
		           collect: [ :digit :factor | digit * factor ]) sum.

	^ digits \\ 11 = 0
]
