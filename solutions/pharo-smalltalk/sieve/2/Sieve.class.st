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

	2 to: anInteger sqrt floor do: [ :i |
		(sieve at: i) ifTrue: [
			i * i to: anInteger by: i do: [ :j | sieve at: j put: false ] ] ].

	"Collect the prime numbers"
	primes := OrderedCollection new.
	2 to: anInteger do: [ :i | (sieve at: i) ifTrue: [ primes add: i ] ].

	^ primes asArray
]
