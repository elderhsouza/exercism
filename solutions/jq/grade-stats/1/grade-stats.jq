# Given a numeric score between 0 and 100, output a letter grade
# - "A" is 90% - 100%
# - "B" is 80% - 89%
# - "C" is 70% - 79%
# - "D" is 60% - 69%
# - "F" is  0% - 59%

def letter_grade:
  if . >= 0 and . < 60 then "F"
  elif . >= 60 and . < 70 then "D"
  elif . >= 70 and . < 80 then "C"
  elif . >= 80 and . < 90 then "B"
  elif . >= 90 and . <= 100 then "A"
  end;


# Given an object that maps a student's name to their grade,
# generate an object that maps the letter grade to the number of 
# students with that grade
def count_letter_grades:
  . as $grades
  | reduce (keys | .[]) as $student (
    {"A": 0, "B": 0, "C": 0, "D": 0, "F": 0};
    $grades[$student] as $grade
    | (
      if $grade >= 0 and $grade < 60 then "F"
      elif $grade >= 60 and $grade < 70 then "D"
      elif $grade >= 70 and $grade < 80 then "C"
      elif $grade >= 80 and $grade < 90 then "B"
      elif $grade >= 90 and $grade <= 100 then "A"
      end
    ) as $letter_grade
    | .[($letter_grade)] += 1
  )
  ;
