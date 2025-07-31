Class {
	#name : #Raindrops,
	#superclass : #Object,
	#instVars : [
		'sounds'
	],
	#category : #'Exercise@Raindrops'
}

{ #category : #converting }
Raindrops >> convertNumber: number [

	| converted |
	converted := (sounds collect: [ :each | each convert: number ]) 
		             joinUsing: ''.

	converted isNotEmpty ifTrue: [ ^ converted ].

	^ number asString
]

{ #category : #initialization }
Raindrops >> initialize [

	sounds := { 
		          Pling new.
		          Plang new.
		          Plong new }
]
