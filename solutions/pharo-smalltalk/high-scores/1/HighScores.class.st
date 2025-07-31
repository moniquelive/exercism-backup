Class {
	#name : #HighScores,
	#superclass : #Object,
	#instVars : [
		'scores'
	],
	#category : #'Exercise@HighScores'
}

{ #category : #adding }
HighScores >> addScores: aCollection [

	scores
		ifNil: [ scores := aCollection asOrderedCollection ]
		ifNotNil: [ scores addAll: aCollection ]
]

{ #category : #accessing }
HighScores >> latestScore [

	^ scores last
]

{ #category : #accessing }
HighScores >> personalBestScores [

	^ scores max 
]

{ #category : #accessing }
HighScores >> personalTopThreeScores [

	^ (scores sorted reversed takeFirst: 3) asArray
]

{ #category : #accessing }
HighScores >> scores [

	^ scores asArray
]
