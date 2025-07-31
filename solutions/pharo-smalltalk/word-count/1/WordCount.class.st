Class {
	#name : #WordCount,
	#superclass : #Object,
	#category : #'Exercise@WordCount'
}

{ #category : #'as yet unclassified' }
WordCount >> countWordsSentence: aString [

	| words assocs |
	words := aString asLowercase allRegexMatches: '(\w[''\w]*\w|\d+)'.
	assocs := words collect: [ :each | 
		          Association key: each value: (words occurrencesOf: each) ].

	^ Dictionary newFromAssociations: assocs
]
