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
IsbnVerifier >> isValidIsbn: anIsbn [

	(regexp matches: anIsbn) ifFalse: [ ^ false ].

	^ ((anIsbn \ '-'
		    collect: [ :each |
			    each = $X
				    ifTrue: [ 10 ]
				    ifFalse: [ each digitValue ] ]
		    into: OrderedCollection new) * #( 10 9 8 7 6 5 4 3 2 1 )) sum
	  \\ 11 = 0
]
