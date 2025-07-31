Class {
	#name : 'MatchingBrackets',
	#superclass : 'Object',
	#category : 'Exercise@MatchingBrackets',
	#package : 'Exercise@MatchingBrackets'
}

{ #category : 'testing' }
MatchingBrackets >> isPaired: aString [

	| stack pairs |
	stack := OrderedCollection new.
	pairs := Dictionary newFrom: {
			         ($) -> $().
			         ($] -> $[).
			         ($} -> ${) }.

	aString do: [ :char |
		(pairs values includes: char) ifTrue: [ stack addLast: char ].
		(pairs includesKey: char) ifTrue: [
			(stack isEmpty or: [ stack last ~= (pairs at: char) ]) ifTrue: [
				^ false ].
			stack removeLast ] ].
	^ stack isEmpty
]
