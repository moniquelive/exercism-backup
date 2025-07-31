Class {
	#name : 'CircularBuffer',
	#superclass : 'Object',
	#instVars : [
		'capacity',
		'buffer'
	],
	#category : 'Exercise@CircularBuffer',
	#package : 'Exercise@CircularBuffer'
}

{ #category : 'accessing' }
CircularBuffer >> capacity: anInteger [

	capacity := anInteger.
	self clear
]

{ #category : 'accessing' }
CircularBuffer >> clear [

	buffer := LinkedList new
]

{ #category : 'writing' }
CircularBuffer >> overwrite: anInteger [

	buffer size = capacity ifTrue: [ self read ].
	self write: anInteger
]

{ #category : 'meta-object-protocol' }
CircularBuffer >> read [

	^ buffer removeFirst
]

{ #category : 'writing' }
CircularBuffer >> write: anInteger [

	buffer size = capacity ifTrue: [
		SubscriptOutOfBounds signalFor: anInteger ].
	buffer addLast: anInteger
]
