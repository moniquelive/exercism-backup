Class {
	#name : 'Sieve',
	#superclass : 'Object',
	#category : 'Exercise@Sieve',
	#package : 'Exercise@Sieve'
}

{ #category : 'as yet unclassified' }
Sieve >> primesLimit: anInteger [

	| sieve primes |
	sieve := Array new: anInteger withAll: true.
	sieve at: 1 put: false.
	primes := OrderedCollection new.

	2 to: anInteger do: [ :i |
		(sieve at: i) ifTrue: [
			primes add: i.
			sieve atAll: (i * i to: anInteger by: i) put: false ] ].

	^ primes asArray
]
