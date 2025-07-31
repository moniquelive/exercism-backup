Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #'as yet unclassified' }
MatchingBrackets class >> if: a dontMatchWith: b [

	a = $} & (b ~= ${) |
	 (a = $] & (b ~= $[)) |
	 (a = $) & (b ~= $()) 
		ifTrue: [ ^ true ].

	^ false
]

{ #category : #testing }
MatchingBrackets class >> isClosing: c [

	^ '}])' includes: c
]

{ #category : #testing }
MatchingBrackets class >> isOpening: c [

	^ '([{' includes: c
]

{ #category : #testing }
MatchingBrackets >> isPaired: aString [

	| st class |
	st := Stack new.
	class := self class.

	aString asArray do: [ :c | 
		st isEmpty
			ifTrue: [ (class isClosing: c) ifTrue: [ ^ false ] ]
			ifFalse: [ (class if: c dontMatchWith: st top) ifTrue: [ ^ false ] ].
		(class isOpening: c) ifTrue: [ st push: c ].
		(class isClosing: c) ifTrue: [ st pop ] ].

	^ st isEmpty
]
