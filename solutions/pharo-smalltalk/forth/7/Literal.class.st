Class {
	#name : 'Literal',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'instance creation' }
Literal class >> newFromToken: token [

	^ token isAllDigits
		  ifTrue: [
			  self basicNew
				  value: token asNumber;
				  yourself ]
		  ifFalse: [ self error: 'number ' , token , ' is not a number!' ]
]

{ #category : 'execution' }
Literal >> execute: st [

	st push: value
]

{ #category : 'accessing' }
Literal >> value: anObject [

	value := anObject
]
