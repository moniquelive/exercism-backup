Class {
	#name : #Luhn,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #'Exercise@Luhn'
}

{ #category : #'as yet unclassified' }
Luhn >> initialize [

	map := Dictionary
		       newFromKeys: #( 0 1 2 3 4 5 6 7 8 9 )
		       andValues: #( 0 2 4 6 8 1 3 5 7 9 )
]

{ #category : #'as yet unclassified' }
Luhn >> validValue: aString [

	| cleaned mapped |
	cleaned := aString reversed substrings joinUsing: ''.
	cleaned size < 2 ifTrue: [ ^ false ].
	cleaned isAllDigits ifFalse: [ ^ false ].

	mapped := cleaned asOrderedCollection withIndexCollect: [ :each :index | 
		          index odd
			          ifTrue: [ each digitValue ]
			          ifFalse: [ map at: each digitValue ] ].

	^ mapped sum isDivisibleBy: 10
]
