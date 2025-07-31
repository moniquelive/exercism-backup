Class {
	#name : 'Proverb',
	#superclass : 'Object',
	#category : 'Exercise@Proverb',
	#package : 'Exercise@Proverb'
}

{ #category : 'as yet unclassified' }
Proverb >> reciteStrings: aCollection [

	| arr |
	arr := OrderedCollection new: aCollection size.

	aCollection overlappingPairsDo: [ :a :b |
		arr addLast: 'For want of a ' , a , ' the ' , b , ' was lost.' ].

	aCollection ifNotEmpty: [
		arr addLast: 'And all for the want of a ' , aCollection first , '.' ].

	^ arr asArray
]
