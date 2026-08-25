Class {
	#name : #Result,
	#superclass : #Object,
	#instVars : [
		'start',
		'end'
	],
	#category : #'Exercise@WordSearch'
}

{ #category : #'instance creation' }
Result class >> from: aPoint to: anotherPoint [
	^ self new
		from: aPoint to: anotherPoint;
		yourself
]

{ #category : #accessing }
Result >> end [

	^ end
]

{ #category : #'instance creation' }
Result >> from: aFrom to: aTo [

	start := aFrom.
	end := aTo.

	^ self
]

{ #category : #accessing }
Result >> start [

	^ start
]
