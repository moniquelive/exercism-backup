Class {
	#name : #Proverb,
	#superclass : #Object,
	#category : #'Exercise@Proverb'
}

{ #category : #'as yet unclassified' }
Proverb >> reciteStrings: aCollection [

	| mapped appended |
	aCollection isEmpty ifTrue: [ ^ #(  ) ].

	mapped := aCollection asOrderedCollection overlappingPairsCollect:
	[		          :a 		          :b | 'For want of a ' , a , ' the ' , b , ' was lost.' ].

	appended := mapped
		            add:
			            'And all for the want of a ' , aCollection first , '.';
		            yourself.

	^ appended asArray
]
