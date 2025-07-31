Class {
	#name : #Gigasecond,
	#superclass : #Object,
	#category : #'Exercise@Gigasecond'
}

{ #category : #adding }
Gigasecond >> addMoment: aString [

	| dt |
	DateAndTime localTimeZone:
		(TimeZone offset: 0 hours name: 'Universal Time' abbreviation: 'UTC').
	dt := aString asDateAndTime + 1000000000 asSeconds.
	^ (dt asDateAndTime asString splitOn: '+') first
]
