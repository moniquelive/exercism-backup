Class {
	#name : 'SimpleCipher',
	#superclass : 'Object',
	#instVars : [
		'_key'
	],
	#category : 'Exercise@SimpleCipher',
	#package : 'Exercise@SimpleCipher'
}

{ #category : 'converting' }
SimpleCipher >> decode: aString [

	| keyBytes bytes |
	keyBytes := (self key copyFrom: 1 to: aString size) asByteArray.
	bytes := aString asByteArray.

	^ (bytes with: keyBytes collect: [ :each :k |
		   | d |
		   d := each - 97 - (k - 97).
		   d < 0 ifTrue: [ d := 26 + d ].
		   97 + d ]) asString
]

{ #category : 'converting' }
SimpleCipher >> encode: aString [

	| keyBytes bytes |
	keyBytes := (self key copyFrom: 1 to: aString size) asByteArray.
	bytes := aString asByteArray.

	^ (bytes with: keyBytes collect: [ :each :k |
		   | d |
		   d := each - 97 + k - 97.
		   97 + (d % 26) ]) asString
]

{ #category : 'accessing' }
SimpleCipher >> key [

	_key ifNil: [ self key: 'a' ].
	^ _key
]

{ #category : 'accessing' }
SimpleCipher >> key: aString [

	_key := aString repeat: 100
]
