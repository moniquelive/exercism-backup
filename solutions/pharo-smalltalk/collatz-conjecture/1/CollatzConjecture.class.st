Class {
	#name : #CollatzConjecture,
	#superclass : #Object,
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #accessing }
CollatzConjecture >> stepsFrom: anInteger [

	| count myInt |
	
	anInteger < 1 ifTrue: [ self error: 'Only positive numbers are allowed' ].
	count := 0.
	myInt := anInteger.
	[ myInt > 1 ] whileTrue: [ 
		myInt := myInt even
			         ifTrue: [ myInt / 2 ]
			         ifFalse: [ 3 * myInt + 1 ].
		count := count + 1 ].
	^ count
]
