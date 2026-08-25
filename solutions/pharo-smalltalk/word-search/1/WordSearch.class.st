Class {
	#name : #WordSearch,
	#superclass : #Object,
	#instVars : [
		'wordGrid'
	],
	#category : #'Exercise@WordSearch'
}

{ #category : #internal }
WordSearch >> directions [
	^ (0 @ 0) eightNeighbors
]

{ #category : #internal }
WordSearch >> find: aWord at: sourcePoint bearing: directionPoint ifPresent: aBlock [
	| currentPoint |

	currentPoint := sourcePoint.

	aWord
		do: [ :character |
			(wordGrid
				at: currentPoint x
				at: currentPoint y
				ifInvalid: nil) = character
					ifFalse: [ ^ self ] ]
		separatedBy: [
			currentPoint := currentPoint + directionPoint ].

	aBlock value: sourcePoint value: currentPoint
]

{ #category : #internal }
WordSearch >> initializeWordGridFrom: gridRows [
	wordGrid := Array2D
		rows: gridRows size
		columns: gridRows first size
		contents: ('' join: gridRows)
]

{ #category : #'as yet unclassified' }
WordSearch >> searchWordsToSearchFor: theWords grid: theGrid [
	| results |

	self initializeWordGridFrom: theGrid.
	results := Dictionary new.

	theWords do: [ :word |
		results at: word put: nil.

		wordGrid withIndicesDo: [ :character :row :column |
			self directions do: [ :direction |
				self
					find: word
					at: row @ column
					bearing: direction
					ifPresent: [ :startPoint :endPoint |
						results
							at: word
							put: (Result
								from: startPoint
								to: endPoint) ] ] ] ].

	^ results
]
