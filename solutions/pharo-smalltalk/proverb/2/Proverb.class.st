Class {
	#name : #Proverb,
	#superclass : #Object,
	#category : #'Exercise@Proverb'
}

{ #category : #'as yet unclassified' }
Proverb >> reciteStrings: aCollection [

	| arr |
	arr := Array new: aCollection size.

	aCollection overlappingPairsWithIndexDo: [ :a :b :i | 
		arr at: i put: 'For want of a ' , a , ' the ' , b , ' was lost.' ].

	arr ifNotEmpty: [ 
		arr
			at: arr size
			put: 'And all for the want of a ' , aCollection first , '.' ].

	^ arr

]
