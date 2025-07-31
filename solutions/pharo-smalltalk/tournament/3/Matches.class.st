Class {
	#name : 'Matches',
	#superclass : 'Object',
	#instVars : [
		'roster'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'accessing' }
Matches >> asString [

	^ roster sorted collect: #asString
]

{ #category : 'initialization' }
Matches >> initialize [

	super initialize.
	roster := SmallDictionary new
]

{ #category : 'as yet unclassified' }
Matches >> play: aMatch [

	| split teamA teamB outcomes |
	split := aMatch splitOn: ';'.
	teamA := self teamNamed: split first.
	teamB := self teamNamed: split second.

	outcomes := {
		            ('win' -> [
		             teamA win.
		             teamB loss ]).
		            ('loss' -> [
		             teamA loss.
		             teamB win ]).
		            ('draw' -> [
		             teamA draw.
		             teamB draw ]) } asDictionary.

	(outcomes at: split third) value.

	^ self
]

{ #category : 'as yet unclassified' }
Matches >> playAll: matches [

	matches do: [ :each | self play: each ]
]

{ #category : 'private' }
Matches >> teamNamed: aName [

	^ roster at: aName ifAbsentPut: [ Team new name: aName ]
]
