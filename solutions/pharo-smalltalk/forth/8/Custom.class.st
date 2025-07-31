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
	tokens := exp substrings allButFirst allButLast.

	^ tokens first isAllDigits
		  ifTrue: [ self error: 'illegal operation' ]
		  ifFalse: [
			  self basicNew
				  mnemonic: tokens first;
				  child: (tokens allButFirst collect: [ :token |
							   token isAllDigits
								   ifTrue: [ Literal newFromToken: token ]
								   ifFalse: [ cat at: token ] ]);
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
