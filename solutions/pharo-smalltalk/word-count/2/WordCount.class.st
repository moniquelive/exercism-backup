Class {
	#name : #WordCount,
	#superclass : #Object,
	#category : #'Exercise@WordCount'
}

{ #category : #'as yet unclassified' }
WordCount >> countWordsSentence: aString [

	| words |
	words := aString asLowercase allRegexMatches: '(\w[''\w]*\w|\d+)'.
	^ (Bag newFrom: words) valuesAndCounts
	
]
