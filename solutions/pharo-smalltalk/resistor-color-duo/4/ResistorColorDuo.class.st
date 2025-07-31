Class {
	#name : 'ResistorColorDuo',
	#superclass : 'Object',
	#instVars : [
		'dict'
	],
	#category : 'Exercise@ResistorColorDuo',
	#package : 'Exercise@ResistorColorDuo'
}

{ #category : 'as yet unclassified' }
ResistorColorDuo >> initialize [

	dict := SmallDictionary
		        newFromKeys:
			        #( 'black' 'brown' 'red' 'orange' 'yellow' 'green' 'blue'
			           'violet' 'grey' 'white' )
		        andValues: #( '0' '1' '2' '3' '4' '5' '6' '7' '8' '9' )
]

{ #category : 'as yet unclassified' }
ResistorColorDuo >> valueWithColors: colors [

	^ (String streamContents: [ :stream |
		   (colors first: 2) do: [ :color |
			   stream nextPutAll:
				   (dict at: color ifAbsent: [ self error: 'Invalid color' ]) ] ])
		  asNumber
]
