Class {
	#name : 'MatchingBrackets',
	#superclass : 'Object',
	#category : 'Exercise@MatchingBrackets',
	#package : 'Exercise@MatchingBrackets'
}

{ #category : 'testing' }
MatchingBrackets >> isPaired: aString [

	| stack pairs |
	stack := Stack new.
	pairs := Dictionary newFromPairs: { $). $(. $]. $[. $}. ${ }.

	aString do: [ :char |
		(pairs values includes: char) ifTrue: [ stack push: char ].
		(pairs includesKey: char) ifTrue: [
			(stack isEmpty or: [ stack top ~= (pairs at: char) ]) ifTrue: [
				^ false ].
			stack pop ] ].
	^ stack isEmpty
]
