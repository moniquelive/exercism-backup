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
			   each ifNotNil: [ 
				   each isCollection
					   ifTrue: [ coll addAll: (self flattenArray: each) ]
					   ifFalse: [ coll add: each ]
				    ]. coll ]) asArray
]
