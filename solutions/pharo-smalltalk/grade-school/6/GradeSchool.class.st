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
		(self grade: each second) add: each first ].
	^ self
]

{ #category : 'accessing' }
GradeSchool >> desiredGrade: aGrade [

	^ (self grade: aGrade) asArray
]

{ #category : 'private' }
GradeSchool >> grade: theGrade [

	^ roster at: theGrade ifAbsentPut: [ SortedCollection new ]
]

{ #category : 'initialization' }
GradeSchool >> initialize [

	super initialize.
	roster := Dictionary new
]

{ #category : 'accessing' }
GradeSchool >> roster [

	^ roster keysSortedSafely flatCollect: [ :grade | self grade: grade ]
]
