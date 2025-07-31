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
		   Character alphabet atWrap: (Character alphabet indexOf: each)
			   - (Character alphabet indexOf: (key atWrap: i)) + 1 ]) asString
]

{ #category : 'converting' }
SimpleCipher >> encode: aString [

	^ (aString withIndexCollect: [ :each :i |
		   Character alphabet atWrap: (Character alphabet indexOf: each)
			   + (Character alphabet indexOf: (key atWrap: i)) - 1 ]) asString
]

{ #category : 'initialization' }
SimpleCipher >> initialize [

	key := (1 to: 100)
		       collect: [ :_ | Character alphabet atRandom ]
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
