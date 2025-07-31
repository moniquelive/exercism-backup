module School (School, add, empty, grade, sorted) where

import Data.List
import Data.Maybe (fromMaybe)
import qualified Data.IntMap as M

type School = M.IntMap [String]

add :: Int -> String -> School -> School
add gradeNum student school =
  let students = grade gradeNum school
  in M.insert gradeNum (sort (student : students)) school

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade gradeNum school = fromMaybe [] (school M.!? gradeNum)

sorted :: School -> [(Int, [String])]
sorted = M.toList
