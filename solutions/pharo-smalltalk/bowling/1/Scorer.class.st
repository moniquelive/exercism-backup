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

{ #category : 'as yet unclassified' }
Scorer >> openScore: anInteger [

	anInteger + 1 <= rolls size ifFalse: [ self error: 'unexpected' ].

	(rolls at: anInteger) + (rolls at: anInteger + 1) > 10 ifTrue: [
		self error: 'Pin count exceeds pins on the lane' ].

	^ (rolls at: anInteger) + (rolls at: anInteger + 1)
]

{ #category : 'as yet unclassified' }
Scorer >> roll: pins [

	| ball last |
	score := 0.
	ball := 1.
	last := nil.

	10 timesRepeat: [
		(self strike: ball)
			ifTrue: [
				score := score + (self strikeScore: ball).
				ball := ball + 1.
				last := 'strike' ]
			ifFalse: [
				(self spare: ball)
					ifTrue: [
						score := score + (self spareScore: ball).
						ball := ball + 2.
						last := 'spare' ]
					ifFalse: [
						score := score + (self openScore: ball).
						ball := ball + 2.
						last := 'open' ] ] ].

	ball = rolls size & (rolls size > 20) & (last = 'open') ifTrue: [
		self error: 'Cannot roll after game is over' ]
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

{ #category : 'as yet unclassified' }
Scorer >> spare: anInteger [

	^ anInteger + 1 <= rolls size and: [
		  (rolls at: anInteger) + (rolls at: anInteger + 1) = 10 ]
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
Scorer >> strikeScore: anInteger [

	| bonus |
	anInteger + 2 <= rolls size ifFalse: [
		self error: 'Score cannot be taken until the end of the game' ].

	bonus := (rolls at: anInteger + 1) + (rolls at: anInteger + 2).

	rolls size = 21 & (bonus > 10) & ((rolls at: anInteger + 1) ~= 10)
		ifTrue: [ self error: 'Pin count exceeds pins on the lane' ].

	^ (rolls at: anInteger) + bonus
]
