Class {
	#name : #Team,
	#superclass : #Magnitude,
	#instVars : [
		'name',
		'wins',
		'draws',
		'losses',
		'points',
		'matches'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #comparing }
Team >> < other [


^ other points < self points | (other points = self points & (self name < other name))
]

{ #category : #comparing }
Team >> = other [

	^ other points = self points

]

{ #category : #converting }
Team >> asString [

	| separator |
	separator := ' | '.

	^ (self name padRightTo: 30) , separator
	  , (matches asString padLeftTo: 2) , separator
	  , (wins asString padLeftTo: 2) , separator
	  , (draws asString padLeftTo: 2) , separator
	  , (losses asString padLeftTo: 2) , separator
	  , (points asString padLeftTo: 2)
]

{ #category : #'accessing - structure variables' }
Team >> draw [

	draws := draws + 1.
	points := points + 1.
		matches := matches + 1
]

{ #category : #initialization }
Team >> initialize [

	name := ''.
	wins := 0.
	draws := 0.
	losses := 0.
	points := 0.
	matches := 0
]

{ #category : #'accessing - structure variables' }
Team >> loss [

	losses := losses + 1.
		matches := matches + 1
]

{ #category : #accessing }
Team >> name [

	^ name
]

{ #category : #accessing }
Team >> name: aName [
	name := aName
]

{ #category : #accessing }
Team >> points [

	^ points
]

{ #category : #'accessing - structure variables' }
Team >> win [

	wins := wins + 1.
	points := points + 3.
	matches := matches + 1.
]
