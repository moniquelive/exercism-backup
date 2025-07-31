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
CircularBuffer >> capacity: newCapacity [

	capacity := newCapacity.
	self clear
]

{ #category : 'accessing' }
CircularBuffer >> clear [

	buffer := LinkedList new
]

{ #category : 'writing' }
CircularBuffer >> overwrite: value [

	buffer size = capacity ifTrue: [ self read ].
	self write: value
]

{ #category : 'meta-object-protocol' }
CircularBuffer >> read [

	^ buffer removeFirst
]

{ #category : 'writing' }
CircularBuffer >> write: value [

	buffer size = capacity ifTrue: [
		SubscriptOutOfBounds signalFor: value ].
	buffer addLast: value
]
