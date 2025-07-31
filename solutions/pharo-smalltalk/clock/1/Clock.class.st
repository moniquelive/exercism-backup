Class {
	#name : #Clock,
	#superclass : #Object,
	#instVars : [
		'minutes'
	],
	#category : #'Exercise@Clock'
}

{ #category : #factory }
Clock class >> hour: hour minute: minute [

	| clock |
	clock := self new.
	
	clock minutes: hour * 60 + minute.

	^ clock
]

{ #category : #arithmetic }
Clock >> + someMinutes [

	minutes := minutes + someMinutes
]

{ #category : #arithmetic }
Clock >> - someMinutes [

	minutes := minutes - someMinutes
]

{ #category : #comparing }
Clock >> = aClock [

	^ self hour = aClock hour and: self minute = aClock minute
]

{ #category : #converting }
Clock >> asString [

	| h m |
	h := self hour printPaddedWith: $0 to: 2.
	m := self minute printPaddedWith: $0 to: 2.

	^ '{1}:{2}' format: { 
			  h.
			  m }
]

{ #category : #accessing }
Clock >> hour [

	^ minutes // 60 \\ 24.
]

{ #category : #accessing }
Clock >> minute [

	^ minutes \\ 60 \\ 60
]

{ #category : #accessing }
Clock >> minutes: someMinutes [

	minutes := someMinutes
]
