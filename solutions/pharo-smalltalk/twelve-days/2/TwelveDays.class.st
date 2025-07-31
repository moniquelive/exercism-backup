Class {
	#name : #TwelveDays,
	#superclass : #Object,
	#category : #'Exercise@TwelveDays'
}

{ #category : #'as yet unclassified' }
TwelveDays >> gifts: number [

	| list |
	list := #( 'a Partridge in a Pear Tree' 'two Turtle Doves'
	           'three French Hens' 'four Calling Birds'
	           'five Gold Rings' 'six Geese-a-Laying'
	           'seven Swans-a-Swimming' 'eight Maids-a-Milking'
	           'nine Ladies Dancing' 'ten Lords-a-Leaping'
	           'eleven Pipers Piping' 'twelve Drummers Drumming' ).
	number = 1
		ifTrue: [ ^ list at: 1 ]
		ifFalse: [ 
			| first |
			first := 'and ' , list first.
			list := first lines , list allButFirst.

			^ ', ' join: (list first: number) reversed ]
]

{ #category : #'as yet unclassified' }
TwelveDays >> reciteStartVerse: first endVerse: last [

	^ ((first to: last) collect: [ :each | self verse: each ]).
]

{ #category : #'as yet unclassified' }
TwelveDays >> verse: number [

	| day gifts |
	day := #( first second third fourth fifth sixth seventh eighth ninth
	          tenth eleventh twelfth ) at: number.

	gifts := self gifts: number.

	^ 'On the ' , day , ' day of Christmas my true love gave to me: '
	  , gifts , '.'
]
