Class {
	#name : #AtbashCipher,
	#superclass : #Object,
	#instVars : [
		'asciiA',
		'asciiZ'
	],
	#category : #'Exercise@AtbashCipher'
}

{ #category : #'private - conversion' }
AtbashCipher >> convertChar: char putOnStream: stream [

	^ stream nextPut: (char isLetter
			   ifTrue: [ Character value: asciiZ - char asInteger +asciiA ]
			   ifFalse: [ char ])
]

{ #category : #converting }
AtbashCipher >> decodePhrase: aString [

	| filtered |
	filtered := self filter: aString.

	^ String streamContents: [ :s | 
		  filtered do: [ :each | self convertChar: each putOnStream: s ]]
]

{ #category : #converting }
AtbashCipher >> encodePhrase: aString [

	| encoded filtered |
	filtered := self filter: aString.
	encoded := String streamContents: [ :s | 
		           filtered do: [ :each | 
			           self convertChar: each putOnStream: s ] ].

	^ (encoded groupsOf: 5) joinUsing: ' '
]

{ #category : #'private - conversion' }
AtbashCipher >> filter: aString [

	^ aString asLowercase select: #isAlphaNumeric
]

{ #category : #initialization }
AtbashCipher >> initialize [

	asciiA := $a asciiValue.
	asciiZ := $z asciiValue.
]
