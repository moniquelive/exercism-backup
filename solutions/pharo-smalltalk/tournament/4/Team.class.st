Class {
	#name : 'Team',
	#superclass : 'Magnitude',
	#instVars : [
		'name',
		'wins',
		'draws',
		'losses',
		'points',
		'matches'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'comparing' }
Team >> < other [

	^ other points < points or: [
		  other points = points and: [ name < other name ] ]
]

{ #category : 'comparing' }
Team >> = other [

	^ other points = points
]

{ #category : 'converting' }
Team >> asString [

	^ {
		  (name padRightTo: 30).
		  (matches asString padLeftTo: 2).
		  (wins asString padLeftTo: 2).
		  (draws asString padLeftTo: 2).
		  (losses asString padLeftTo: 2).
		  (points asString padLeftTo: 2) } joinUsing: ' | '
]

{ #category : 'accessing - structure variables' }
Team >> draw [

	draws := draws + 1.
	points := points + 1.
		matches := matches + 1
]

{ #category : 'initialization' }
Team >> initialize [

	super initialize.
	name := ''.
	wins := 0.
	draws := 0.
	losses := 0.
	points := 0.
	matches := 0
]

{ #category : 'accessing - structure variables' }
Team >> loss [

	losses := losses + 1.
		matches := matches + 1
]

{ #category : 'accessing' }
Team >> name [
	^ name
]

{ #category : 'accessing' }
Team >> name: aName [
	name := aName
]

{ #category : 'accessing' }
Team >> points [

	^ points
]

{ #category : 'accessing - structure variables' }
Team >> win [

	wins := wins + 1.
	points := points + 3.
	matches := matches + 1.
]
