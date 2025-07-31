Class {
	#name : 'TwelveDays',
	#superclass : 'Object',
	#instVars : [
		'gifts',
		'ordinals'
	],
	#category : 'Exercise@TwelveDays',
	#package : 'Exercise@TwelveDays'
}

{ #category : 'as yet unclassified' }
TwelveDays >> gifts: number [

	^ number = 1
		  ifTrue: [ gifts first ]
		  ifFalse: [
			  ({ ('and ' , gifts first) } , gifts allButFirst first: number)
				  reversed joinUsing: ', ' ]
]

{ #category : 'initialization' }
TwelveDays >> initialize [

	super initialize.
	gifts := #( 'a Partridge in a Pear Tree' 'two Turtle Doves'
	            'three French Hens' 'four Calling Birds'
	            'five Gold Rings' 'six Geese-a-Laying'
	            'seven Swans-a-Swimming' 'eight Maids-a-Milking'
	            'nine Ladies Dancing' 'ten Lords-a-Leaping'
	            'eleven Pipers Piping' 'twelve Drummers Drumming' ).
	ordinals := #( #first #second #third #fourth #fifth #sixth #seventh
	               #eighth #ninth #tenth #eleventh #twelfth )
]

{ #category : 'as yet unclassified' }
TwelveDays >> reciteStartVerse: first endVerse: last [

	^ ((first to: last) collect: [ :each | self verse: each ]).
]

{ #category : 'as yet unclassified' }
TwelveDays >> verse: number [

	^ 'On the ' , (ordinals at: number)
	  , ' day of Christmas my true love gave to me: '
	  , (self gifts: number) , '.'
]
