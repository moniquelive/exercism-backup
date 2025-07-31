Class {
	#name : 'Custom',
	#superclass : 'Object',
	#instVars : [
		'child',
		'mnemonic'
	],
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'instance creation' }
Custom class >> new: exp withCatalog: cat [

	| tokens |
	tokens := (exp findTokens: Character separators) allButFirst
		          allButLast.

	^ tokens first isAllDigits
		  ifTrue: [ self error: 'illegal operation' ]
		  ifFalse: [
			  self basicNew
				  mnemonic: tokens first;
				  child: (tokens allButFirst collect: [ :t |
							   t isAllDigits
								   ifTrue: [ Literal newFromToken: t ]
								   ifFalse: [ cat at: t ] ]);
				  yourself ]
]

{ #category : 'accessing' }
Custom >> child: anObject [

	child := anObject
]

{ #category : 'execution' }
Custom >> execute: st [

	^ child do: [ :c | c execute: st ]
]

{ #category : 'accessing' }
Custom >> mnemonic [

	^ mnemonic
]

{ #category : 'accessing' }
Custom >> mnemonic: anObject [

	mnemonic := anObject
]
