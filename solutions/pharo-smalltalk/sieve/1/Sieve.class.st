Class {
	#name : #Sieve,
	#superclass : #Object,
	#category : #'Exercise@Sieve'
}

{ #category : #'as yet unclassified' }
Sieve >> primesLimit: anInteger [

	| arr |
	arr := (2 to: anInteger) asOrderedCollection.

	2 to: anInteger do: [ :n | 
		arr removeAllSuchThat: [ :each | 
			each ~= n and: (each isDivisibleBy: n) ] ].

	^ arr asArray 
]
