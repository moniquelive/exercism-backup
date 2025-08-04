Class {
	#name : #Rectangles,
	#superclass : #Object,
	#category : #'Exercise@Rectangles'
}

{ #category : #'as yet unclassified' }
Rectangles >> horizontalEdgeOn: rowString from: c1 to: c2 [

	c2 > c1 ifFalse: [ ^ false ].
	(rowString at: c1) ~= $+ ifTrue: [ ^ false ].
	(rowString at: c2) ~= $+ ifTrue: [ ^ false ].
	c2 > (c1 + 1) ifTrue: [ 
		| interior |
		interior := rowString copyFrom: c1 + 1 to: c2 - 1.
		(interior allSatisfy: [ :ch | '-+' includes: ch ]) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #'as yet unclassified' }
Rectangles >> padLine: aString to: width [
    | pad |
    pad := width - aString size.
    ^ aString , (pad > 0
        ifTrue: [ String new: pad withAll: Character space ]
        ifFalse: [ '' ]).
]

{ #category : #'as yet unclassified' }
Rectangles >> rectangleAtTop: r1 bottom: r2 left: c1 right: c2 in: grid [

	| topRow bottomRow top bottom left right |
	topRow := grid at: r1.
	bottomRow := grid at: r2.
	top := self horizontalEdgeOn: topRow from: c1 to: c2.
	bottom := self horizontalEdgeOn: bottomRow from: c1 to: c2.
	left := self
		        verticalEdgeOnColumn: c1
		        fromRow: r1
		        toRow: r2
		        in: grid.
	right := self
		         verticalEdgeOnColumn: c2
		         fromRow: r1
		         toRow: r2
		         in: grid.
	^ top and: (bottom and: (left and: right))
]

{ #category : #'as yet unclassified' }
Rectangles >> rectanglesFromStrings: diagram [
    | rows cols grid rectangles |
    (diagram isNil or: [ diagram isEmpty ]) ifTrue: [ ^ 0 ].
    rows := diagram size.
    (rows < 2) ifTrue: [ ^ 0 ].
    cols := (diagram collect: [:line | line size]) max.
    (cols < 2) ifTrue: [ ^ 0 ].
    grid := (diagram collect: [:line | self padLine: line to: cols]).
    rectangles := 0.
    1 to: rows - 1 do: [:r1 |
        (r1 + 1) to: rows do: [:r2 |
            | goodCols |
            goodCols := (1 to: cols) select: [:c |
                ((grid at: r1) at: c) = $+ and: [ ((grid at: r2) at: c) = $+ ]].
            goodCols do: [:c1 |
                goodCols do: [:c2 |
                    (c2 > c1)
                        ifTrue: [
                            (self rectangleAtTop: r1
                                            bottom: r2
                                              left: c1
                                             right: c2
                                               in: grid)
                                ifTrue: [ rectangles := rectangles + 1 ].
                        ]].
            ].
        ]].
    ^ rectangles.
]

{ #category : #'as yet unclassified' }
Rectangles >> verticalEdgeOnColumn: c fromRow: r1 toRow: r2 in: grid [

	r2 > r1 ifFalse: [ ^ false ].
	((grid at: r1) at: c) ~= $+ ifTrue: [ ^ false ].
	((grid at: r2) at: c) ~= $+ ifTrue: [ ^ false ].
	r2 > (r1 + 1) ifTrue: [ 
		r1 + 1 to: r2 - 1 do: [ :r | 
			| ch |
			ch := (grid at: r) at: c.
			('+|' includes: ch) ifFalse: [ ^ false ] ] ].
	^ true
]
