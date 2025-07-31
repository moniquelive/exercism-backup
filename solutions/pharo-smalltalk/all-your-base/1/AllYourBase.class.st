Class {
	#name : #AllYourBase,
	#superclass : #Object,
	#category : #'Exercise@AllYourBase'
}

{ #category : #converting }
AllYourBase >> rebaseInputBase: inputBase digits: digits outputBase: outputBase [

	| int acc |
	inputBase < 2 ifTrue: [ self error: 'input base must be >= 2' ].
	outputBase < 2 ifTrue: [ self error: 'output base must be >= 2' ].
	digits isEmpty ifTrue: [ ^ #( 0 ) ].

	(digits allSatisfy: [ :each | 0 <= each and: [ each < inputBase ] ]) 
		ifFalse: [ 
		self error: 'all digits must satisfy 0 <= d < input base' ].

	int := digits reduce: [ :a :b | a * inputBase + b ].
	acc := OrderedCollection new.
	[ int >= outputBase ] whileTrue: [ 
		acc addFirst: int % outputBase.
		int := int // outputBase].

	acc addFirst: int.
	^ acc asArray
]
