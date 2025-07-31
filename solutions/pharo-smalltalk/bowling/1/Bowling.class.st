Class {
	#name : 'Bowling',
	#superclass : 'Object',
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'scoring' }
Bowling >> scoreAfterRolling: rolls [

	rolls size < 12 ifTrue: [
		self error: 'Score cannot be taken until the end of the game' ].

	^ (Scorer with: rolls) score
]

{ #category : 'scoring' }
Bowling >> scoreRolling: roll after: rolls [

	roll < 0 ifTrue: [ self error: 'Negative roll is invalid' ].
	roll > 10 "| (rolls size = 20)" ifTrue: [
		self error: 'Pin count exceeds pins on the lane' ].
	rolls size > 20 ifTrue: [
		self error: 'Cannot roll after game is over' ].

	^ (Scorer with: rolls , { roll }) score
]
