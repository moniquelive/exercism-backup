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

	| ws |
	ws := WriteStream on: String new.
	sounds do: [ :each | ws nextPutAll: (each convert: number) ].
	ws isEmpty ifTrue: [ ^ number asString ].

	^ ws contents
]

{ #category : #initialization }
Raindrops >> initialize [

	sounds := (SortedCollection sortUsing: #factor ascending)
		          addAll: (Sounds subclasses collect: #new);
		          asArray
]
