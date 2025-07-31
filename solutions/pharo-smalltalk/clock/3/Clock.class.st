Class {
	#name : 'Clock',
	#superclass : 'Object',
	#instVars : [
		'minutes'
	],
	#category : 'Exercise@Clock',
	#package : 'Exercise@Clock'
}

{ #category : 'factory' }
Clock class >> hour: hour minute: minute [

	^ self
		  basicNew
		  minutes: hour * 60 + minute;
		  yourself
]

{ #category : 'arithmetic' }
Clock >> + someMinutes [

	minutes := minutes + someMinutes
]

{ #category : 'arithmetic' }
Clock >> - someMinutes [

	minutes := minutes - someMinutes
]

{ #category : 'comparing' }
Clock >> = other [

	^ self hour = other hour and: [ self minute = other minute ]
]

{ #category : 'converting' }
Clock >> asString [

	^ (self hour printPaddedWith: $0 to: 2) , ':'
	  , (self minute printPaddedWith: $0 to: 2)
]

{ #category : 'accessing' }
Clock >> hour [

	^ minutes // 60 \\ 24
]

{ #category : 'accessing' }
Clock >> minute [

	^ minutes \\ 60 \\ 60
]

{ #category : 'setter' }
Clock >> minutes: someMinutes [

	minutes := someMinutes
]
