Class {
	#name : 'ResistorColorDuo',
	#superclass : 'Object',
	#category : 'Exercise@ResistorColorDuo',
	#package : 'Exercise@ResistorColorDuo'
}

{ #category : 'accessing' }
ResistorColorDuo >> value: color [

	| colors |
	colors := #( 'black' 'brown' 'red' 'orange' 'yellow' 'green' 'blue'
	             'violet' 'grey' 'white' ).
	^ (colors indexOf: color ifAbsent: [ self error: 'Invalid color' ])
	  - 1
]

{ #category : 'as yet unclassified' }
ResistorColorDuo >> valueWithColors: colors [

	^ (self value: colors first) * 10 + (self value: colors second)
]
