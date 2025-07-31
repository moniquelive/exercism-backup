Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'roster'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudents: students [

	students do: [ :each | 
		| grade name gradeStudents |
		name := each at: 1.
		grade := each at: 2.
		gradeStudents := self studentsForGrade: grade.
		gradeStudents add: name.
		roster at: grade put: gradeStudents ].

	^ self
]

{ #category : #accessing }
GradeSchool >> desiredGrade: aGrade [

	^ (self studentsForGrade: aGrade) asArray
]

{ #category : #adding }
GradeSchool >> initialize [

	roster := Dictionary new
]

{ #category : #accessing }
GradeSchool >> roster [

	| sortedKeys sortedStudents |
	sortedKeys := SortedCollection newFrom: roster keys.
	sortedStudents := sortedKeys flatCollect: [ :each | 
		                  self desiredGrade: each ].

	^ sortedStudents asArray
]

{ #category : #accessing }
GradeSchool >> studentsForGrade: grade [

	^ roster at: grade ifAbsent: [ ^ SortedCollection new ]
]
