Class {
	#name : 'CollatzConjecture',
	#superclass : 'Object',
	#category : 'Exercise@CollatzConjecture',
	#package : 'Exercise@CollatzConjecture'
}

{ #category : 'accessing' }
CollatzConjecture >> stepsFrom: aNumber [
	"Calculate the number of steps to reach 1 in the Collatz sequence starting from aNumber."

	| count number |
	aNumber < 1 ifTrue: [
		self error: 'Only positive numbers are allowed' ].

	count := 0.
	number := aNumber.
	[ number > 1 ] whileTrue: [
		number := number even
			          ifTrue: [ number // 2 ]
			          ifFalse: [ 3 * number + 1 ].
		count := count + 1 ].

	^ count
]
