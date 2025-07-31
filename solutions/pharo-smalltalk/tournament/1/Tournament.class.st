Class {
	#name : #Tournament,
	#superclass : #Object,
	#category : #'Exercise@Tournament'
}

{ #category : #'as yet unclassified' }
Tournament >> tallyRows: plays [

	^ Array
		  with: 'Team                           | MP |  W |  D |  L |  P'
		  withAll: (Teams new playAll: plays) result
]
