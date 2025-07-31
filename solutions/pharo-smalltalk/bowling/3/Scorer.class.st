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

	^ self basicNew
		  rolls: rolls;
		  yourself
]

{ #category : 'private' }
Scorer >> isSpareAt: ball [

	^ ball + 1 <= rolls size and: [
		  (rolls at: ball) + (rolls at: ball + 1) = 10 ]
]

{ #category : 'private' }
Scorer >> isStrikeAt: ball [

	^ ball <= rolls size and: [ (rolls at: ball) = 10 ]
]

{ #category : 'scoring' }
Scorer >> openScoreAt: ball [

	^ (rolls at: ball) + (rolls at: ball + 1)
]

{ #category : 'scoring' }
Scorer >> roll: pins [

	| ball |
	score := 0.
	ball := 1.

	10 timesRepeat: [
		(self isStrikeAt: ball)
			ifTrue: [
				score := score + (self strikeScoreAt: ball).
				ball := ball + 1 ]
			ifFalse: [
				score := score + (self scoreFrameStartingAt: ball).
				ball := ball + 2 ] ]
]

{ #category : 'accessing' }
Scorer >> rolls: theRolls [

	rolls := theRolls.
	score := 0.

	rolls do: [ :each | self roll: each ]
]

{ #category : 'accessing' }
Scorer >> score [

	^ score
]

{ #category : 'private' }
Scorer >> scoreFrameStartingAt: ball [

	^ (self isSpareAt: ball)
		  ifTrue: [ self spareScoreAt: ball ]
		  ifFalse: [ self openScoreAt: ball ]
]

{ #category : 'scoring' }
Scorer >> spareScoreAt: ball [

	^ ball + 2 <= rolls size
		  ifFalse: [
		  self error: 'Score cannot be taken until the end of the game' ]
		  ifTrue: [
			  (rolls at: ball) + (rolls at: ball + 1)
			  + (rolls at: ball + 2) ]
]

{ #category : 'scoring' }
Scorer >> strikeScoreAt: ball [

	ball + 2 <= rolls size ifFalse: [
		self error: 'Score cannot be taken until the end of the game' ].

	^ (rolls at: ball) + (rolls at: ball + 1) + (rolls at: ball + 2)
]
