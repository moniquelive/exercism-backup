Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#classInstVars : [
		'closings',
		'openings'
	],
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #'as yet unclassified' }
MatchingBrackets class >> if: a matchesWith: b [

	a = $} & (b ~= ${) | (a = $] & (b ~= $[)) | (a = $) & (b ~= $()) 
		ifTrue: [ ^ false ].

	^ true
]

{ #category : #initialization }
MatchingBrackets class >> initialize [

	"
	MatchingBrackets initialize.
	"


	openings := Set newFrom: '([{'.
			closings := Set newFrom: '}])'.
		
]

{ #category : #testing }
MatchingBrackets class >> isClosing: c [

	^ closings includes: c
]

{ #category : #testing }
MatchingBrackets class >> isOpening: c [

	^ openings includes: c
]

{ #category : #testing }
MatchingBrackets >> isPaired: aString [

	| st class |
	st := Stack new.
	class := self class.

	aString asArray do: [ :c | 
		st isEmpty
			ifTrue: [ (class isClosing: c) ifTrue: [ ^ false ] ]
			ifFalse: [ (class if: c matchesWith: st top) ifFalse: [ ^ false ] ].
		(class isOpening: c) ifTrue: [ st push: c ].
		(class isClosing: c) ifTrue: [ st pop ] ].

	^ st isEmpty
]
