Extension { #name : #Point }

{ #category : #'*Exercise@RobotSimulator' }
Point >> asDictionary [
	^ Dictionary newFromPairs: {'x' . self x . 'y'. self y}
]
