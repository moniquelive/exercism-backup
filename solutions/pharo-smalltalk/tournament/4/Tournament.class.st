Class {
	#name : 'Tournament',
	#superclass : 'Object',
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'as yet unclassified' }
Tournament >> tallyRows: matches [

	^ Array
		  with: 'Team                           | MP |  W |  D |  L |  P'
		  withAll: (Matches new playAll: matches) asString
]
