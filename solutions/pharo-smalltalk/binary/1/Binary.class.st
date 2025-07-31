Class {
	#name : #Binary,
	#superclass : #Object,
	#instVars : [
		'ascii0'
	],
	#category : #'Exercise@Binary'
}

{ #category : #'as yet unclassified' }
Binary >> decimalFromBinary: binary [

	| power |
	(binary reject: [ :each | '01' includes: each ]) isNotEmpty ifTrue: [ 
		^ nil ].

	power := -1.

	^ binary asByteArray reversed inject: 0 into: [ :base10 :each | 
		  power := power + 1.
		  base10 + ((each - ascii0) * (2 raisedTo: power)) ]
]

{ #category : #initialization }
Binary >> initialize [ 
	ascii0 := (Character digitValue: 0) asciiValue.
]
