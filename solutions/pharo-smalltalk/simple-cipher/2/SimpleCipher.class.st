Class {
	#name : 'SimpleCipher',
	#superclass : 'Object',
	#instVars : [
		'key'
	],
	#category : 'Exercise@SimpleCipher',
	#package : 'Exercise@SimpleCipher'
}

{ #category : 'converting' }
SimpleCipher >> decode: aString [

	^ (aString withIndexCollect: [ :each :i |
		   | d |
		   d := (Character alphabet indexOf: each)
		        - (Character alphabet indexOf: (key atWrap: i)).
		   Character alphabet atWrap: d + 1 ]) asString
]

{ #category : 'converting' }
SimpleCipher >> encode: aString [

	^ (aString withIndexCollect: [ :each :i |
		   | d |
		   d := (Character alphabet indexOf: each)
		        + (Character alphabet indexOf: (key atWrap: i)).
		   Character alphabet atWrap: d - 1 ]) asString
]

{ #category : 'initialization' }
SimpleCipher >> initialize [

	key := (1 to: 100)
		       collect: [ :n | Character alphabet atRandom ]
		       as: String
]

{ #category : 'accessing' }
SimpleCipher >> key [

	^ key
]

{ #category : 'accessing' }
SimpleCipher >> key: aString [

	key := aString 
]
