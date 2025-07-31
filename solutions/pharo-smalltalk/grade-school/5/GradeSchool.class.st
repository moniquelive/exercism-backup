Class {
	#name : 'GradeSchool',
	#superclass : 'Object',
	#instVars : [
		'roster'
	],
	#category : 'Exercise@GradeSchool',
	#package : 'Exercise@GradeSchool'
}

{ #category : 'adding' }
GradeSchool >> addStudents: studentsWithGrades [

	studentsWithGrades do: [ :each |
		(self namesForGrade: each second) add: each first ].
	^ self
]

{ #category : 'accessing' }
GradeSchool >> desiredGrade: aGrade [

	^ (self namesForGrade: aGrade) asArray
]

{ #category : 'initialization' }
GradeSchool >> initialize [

	super initialize.
	roster := Dictionary new
]

{ #category : 'private' }
GradeSchool >> namesForGrade: grade [

	^ roster at: grade ifAbsentPut: [ SortedCollection new ]
]

{ #category : 'accessing' }
GradeSchool >> roster [

	^ roster keys sorted flatCollect: [ :grade |
		  self desiredGrade: grade ]
]
