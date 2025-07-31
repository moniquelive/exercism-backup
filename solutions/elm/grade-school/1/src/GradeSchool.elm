module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    let
        students =
            studentsInGrade grade school
    in
    Dict.insert grade (student :: students) school


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school |> Maybe.withDefault [] |> List.sort


allStudents : School -> List ( Grade, List Student )
allStudents school =
    let
        allGrades =
            Dict.keys school

        gradeAndStudents grade =
            ( grade, studentsInGrade grade school )
    in
    List.map gradeAndStudents allGrades
