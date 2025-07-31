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

	^ String streamContents: [ :stream | 
		  sounds do: [ :sound | stream nextPutAll: (sound convert: number) ].
		  stream isEmpty ifTrue: [ stream nextPutAll: number asString ] ]
]

{ #category : #initialization }
Raindrops >> initialize [

	sounds := (Sounds subclasses collect: #new) sort: [ :a :b | 
		          a factor < b factor ]
]
