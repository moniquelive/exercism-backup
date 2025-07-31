Class {
	#name : #Custom,
	#superclass : #Object,
	#instVars : [
		'child',
		'mnemonic'
	],
	#category : #'Exercise@Forth'
}

{ #category : #'instance creation' }
Custom class >> new: exp withCatalog: cat [

	| inst tokens |
	inst := self new.

	tokens := (exp findTokens: Character separators) allButFirst
		          allButLast.
	inst mnemonic: tokens first.
	inst child: (tokens allButFirst collect: [ :t | 
			 [ Literal newFromToken: t ]
				 on: Error
				 do: [ cat at: t ] ]).

	^ inst
]

{ #category : #accessing }
Custom >> child: anObject [

	child := anObject
]

{ #category : #execution }
Custom >> execute: st [

	^ child do: [ :c | c execute: st ]
]

{ #category : #initialization }
Custom >> initialize [

	child := OrderedCollection
]

{ #category : #accessing }
Custom >> mnemonic [

	^ mnemonic
]

{ #category : #accessing }
Custom >> mnemonic: anObject [

	mnemonic := anObject
]
