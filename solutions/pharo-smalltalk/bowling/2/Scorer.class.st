Class {
	#name : 'Scorer',
	#superclass : 'Object',
	#instVars : [
		'score',
		'rolls'
	],
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'instance creation' }
Scorer class >> with: rolls [

	^ self new
		  rolls: rolls;
		  yourself
]

{ #category : 'scoring' }
Scorer >> openScore: anInteger [

	^ (rolls at: anInteger) + (rolls at: anInteger + 1)
]

{ #category : 'scoring' }
Scorer >> roll: pins [

	| ball |
	score := 0.
	ball := 1.

	10 timesRepeat: [
		(self strike: ball)
			ifTrue: [
				score := score + (self strikeScore: ball).
				ball := ball + 1 ]
			ifFalse: [
				score := score + ((self spare: ball)
					          ifTrue: [ self spareScore: ball ]
					          ifFalse: [ self openScore: ball ]).
				ball := ball + 2 ] ]
]

{ #category : 'accessing' }
Scorer >> rolls: rr [

	rolls := rr.
	score := 0.

	rolls do: [ :each | self roll: each ]
]

{ #category : 'accessing' }
Scorer >> score [

	^ score
]

{ #category : 'scoring' }
Scorer >> spare: anInteger [

	^ anInteger + 1 <= rolls size and: [
		  (rolls at: anInteger) + (rolls at: anInteger + 1) = 10 ]
]

{ #category : 'scoring' }
Scorer >> spareScore: anInteger [

	anInteger + 2 <= rolls size ifFalse: [
		self error: 'Score cannot be taken until the end of the game' ].

	^ (rolls at: anInteger) + (rolls at: anInteger + 1)
	  + (rolls at: anInteger + 2)
]

{ #category : 'formatting' }
Scorer >> strike: anInteger [

	^ anInteger <= rolls size and: [ (rolls at: anInteger) = 10 ]
]

{ #category : 'scoring' }
Scorer >> strikeScore: anInteger [

	anInteger + 2 <= rolls size ifFalse: [
		self error: 'Score cannot be taken until the end of the game' ].

	^ (rolls at: anInteger) + (rolls at: anInteger + 1)
	  + (rolls at: anInteger + 2)
]
