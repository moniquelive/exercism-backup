Class {
	#name : #Forth,
	#superclass : #Object,
	#instVars : [
		'st',
		'words',
		'catalog'
	],
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Forth >> evaluateInstructions: instructions [

	| coll defs exps |
	coll := instructions groupedBy: [ :v | v beginsWith: ':' ].
	defs := coll at: true ifAbsent: [ #(  ) ].
	exps := coll at: false ifAbsent: [ self error: 'illegal operation' ].

	defs do: [ :def | 
		| c |
		c := Custom new: def asLowercase withCatalog: catalog.
		catalog at: c symbol put: c ].

	exps do: [ :exp | 
		(exp asLowercase findTokens: Character separators) do: [ :token | 
			| w |
			w := [ Literal newFromToken: token ]
				     on: Error
				     do: [ 
				     catalog
					     at: token
					     ifAbsent: [ self error: 'undefined operation' ] ].
			w execute: st ] ].

	^ st asArray reverse
]

{ #category : #initialization }
Forth >> initialize [

	st := Stack new.
	catalog := SmallDictionary new.

	Word subclasses do: [ :each | catalog at: each symbol put: each new ]
]
