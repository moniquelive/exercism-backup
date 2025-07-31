Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#classInstVars : [
		'delims'
	],
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #'as yet unclassified' }
MatchingBrackets class >> if: a matchesWith: b [

	delims at: a ifPresent: [ :first | ^ first = b ].

	self error: 'unxexpected'
]

{ #category : #initialization }
MatchingBrackets class >> initialize [

	"
	MatchingBrackets initialize.
	"

	delims := Dictionary newFrom: { 
			          ($( -> $)).
			          ($[ -> $]).
			          (${ -> $}) }.

]

{ #category : #testing }
MatchingBrackets class >> isClosing: c [

	^ delims values includes: c
]

{ #category : #testing }
MatchingBrackets class >> isOpening: c [

	^ delims keys includes: c
]

{ #category : #testing }
MatchingBrackets >> isPaired: aString [

	| st class |
	st := Stack new.
	class := self class.

	aString asArray do: [ :c | 
		st isEmpty
			ifTrue: [ (class isClosing: c) ifTrue: [ ^ false ] ]
			ifFalse: [
				(class isClosing: c) ifTrue: [ 
				(class if: st top matchesWith: c) ifFalse: [ ^ false ]
				]
			].
		(class isOpening: c) ifTrue: [ st push: c ].
		(class isClosing: c) ifTrue: [ st pop ] ].

	^ st isEmpty
]
