Class {
	#name : #Forth,
	#superclass : #Object,
	#instVars : [
		'st',
		'catalog'
	],
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Forth >> evaluateInstructions: instructions [

	instructions do: [ :instr | 
		(instr beginsWith: ':')
			ifTrue: [ 
				| c |
				c := Custom new: instr asLowercase withCatalog: catalog.
				catalog at: c mnemonic put: c ]
			ifFalse: [ 
				(instr asLowercase findTokens: Character separators) do: [ :token | 
					| w |
					w := [ Literal newFromToken: token ]
						     on: Error
						     do: [ 
						     catalog
							     at: token
							     ifAbsent: [ self error: 'undefined operation' ] ].
					w execute: st ] ] ].

	^ st asArray reverse
]

{ #category : #initialization }
Forth >> initialize [

	st := Stack new.
	catalog := SmallDictionary new.

	Word subclasses do: [ :each | catalog at: each mnemonic put: each new ]
]
