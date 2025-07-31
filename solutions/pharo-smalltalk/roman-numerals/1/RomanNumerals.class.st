Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'as yet unclassified' }
RomanNumerals >> romanNumber: anInteger [

	| map assoc |
	anInteger <1 ifTrue: [ ^ '' ].

	map := OrderedDictionary
		       newFromKeys: #( 1000 900 500 400 100 90 50 40 10 9 5 4 1 )
		       andValues:
		       #( 'M' 'CM' 'D' 'CD' 'C' 'XC' 'L' 'XL' 'X' 'IX' 'V' 'IV' 'I' ).

	assoc := map associationsSelect: [ :each | anInteger >= each key ].

	^ assoc values first
	  , (self romanNumber: anInteger - assoc keys first)
]
