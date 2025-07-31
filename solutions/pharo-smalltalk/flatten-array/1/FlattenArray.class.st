Class {
	#name : #FlattenArray,
	#superclass : #Object,
	#category : #'Exercise@FlattenArray'
}

{ #category : #'as yet unclassified' }
FlattenArray >> flattenArray: aColl [

	^ (aColl asOrderedCollection
		   inject: OrderedCollection new
		   into: [ :coll :each | 
			   each ifNil: [ coll ] ifNotNil: [ 
				   each isNumber
					   ifTrue: [ 
						   coll
							   add: each;
							   yourself ]
					   ifFalse: [ coll addAll: (self flattenArray: each); yourself ] ] ])
		  asArray
]
