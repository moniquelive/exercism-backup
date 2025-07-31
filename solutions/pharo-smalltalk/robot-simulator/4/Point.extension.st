Extension { #name : #Point }

{ #category : '*Exercise@RobotSimulator' }
Point >> asDictionary [

	^ {
		  ('x' -> x).
		  ('y' -> y) } asDictionary
]
