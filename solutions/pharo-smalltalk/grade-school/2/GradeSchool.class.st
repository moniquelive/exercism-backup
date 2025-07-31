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
		| grade name studentsOnGrade |
		name := each at: 1.
		grade := each at: 2.
		studentsOnGrade := OrderedCollection newFrom: (self desiredGrade: grade).
		studentsOnGrade add: name.
		roster at: grade put: studentsOnGrade ].

	^ self
]

{ #category : #accessing }
GradeSchool >> desiredGrade: aGrade [

	| grade |
	grade := roster at: aGrade ifAbsent: [ ^ #(  ) ].

	^ grade asSortedCollection asArray
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
