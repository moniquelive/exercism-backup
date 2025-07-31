Class {
	#name : 'BinarySearchTree',
	#superclass : 'Object',
	#instVars : [
		'data',
		'left',
		'right'
	],
	#category : 'Exercise@BinarySearchTree',
	#package : 'Exercise@BinarySearchTree'
}

{ #category : 'accessing' }
BinarySearchTree >> add: aString [

	data ifNil: [ data := aString ] ifNotNil: [
		aString <= data
			ifTrue: [
				left ifNil: [ left := self class new ].
				left add: aString ]
			ifFalse: [
				right ifNil: [ right := self class new ].
				right add: aString ] ]
]

{ #category : 'accessing' }
BinarySearchTree >> data [

	^ data
]

{ #category : 'accessing' }
BinarySearchTree >> left [

	^ left
]

{ #category : 'accessing' }
BinarySearchTree >> right [

	^ right
]

{ #category : 'sorting' }
BinarySearchTree >> sortedData [

	^ (left ifNil: [ {  } ] ifNotNil: [ left sortedData ])
	  , (data ifNil: [ {  } ] ifNotNil: [ { data } ])
	  , (right ifNil: [ {  } ] ifNotNil: [ right sortedData ])
]

{ #category : 'building' }
BinarySearchTree >> treeData: aCollection [

	aCollection do: [ :each | self add: each ].

	^ self
]
