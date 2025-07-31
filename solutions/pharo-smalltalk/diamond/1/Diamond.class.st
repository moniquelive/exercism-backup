Class {
	#name : #Diamond,
	#superclass : #Object,
	#category : #'Exercise@Diamond'
}

{ #category : #'as yet unclassified' }
Diamond >> rowsLetter: letter [

	| d asciiA quarter lines |
	asciiA := #A first asciiValue.
	d := letter first asciiValue - asciiA.

	quarter := (0 to: d) collect: [ :each | 
		           | prefix suffix currChar|
		           prefix := ' ' repeat: each.
		           suffix := ' ' repeat: d - each.
		currChar := (String value: asciiA + each).
		           prefix , currChar , suffix ].

	lines := quarter collect: [ :each | each reversed , each allButFirst ].

	^ lines , lines reversed allButFirst
]
