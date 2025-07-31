Class {
	#name : 'Forth',
	#superclass : 'Object',
	#instVars : [
		'st',
		'catalog'
	],
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Forth >> evaluateInstructions: instructions [

	instructions do: [ :instr |
		(instr beginsWith: ':')
			ifTrue: [ "defining a custom command"
				| c |
				c := Custom new: instr asLowercase withCatalog: catalog.
				catalog at: c mnemonic put: c ]
			ifFalse: [ "known command"
				(instr asLowercase findTokens: Character separators) do: [ :token |
					(token isAllDigits
						 ifTrue: [ Literal newFromToken: token ]
						 ifFalse: [
						 catalog
							 at: token
							 ifAbsent: [ self error: 'undefined operation' ] ]) execute: st ] ] ].

	^ st asArray reverse
]

{ #category : 'initialization' }
Forth >> initialize [

	super initialize.
	st := Stack new.
	catalog := SmallDictionary
		           newFromKeys: (Word subclasses collect: #mnemonic)
		           andValues: (Word subclasses collect: #new)
]
