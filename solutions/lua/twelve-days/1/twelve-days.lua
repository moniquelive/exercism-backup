local ordinals = {
  "first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
}
local subjects = {
  "a Partridge", "two Turtle Doves", "three French Hens", "four Calling Birds",
  "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming",
  "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping",
  "eleven Pipers Piping", "twelve Drummers Drumming",
}
local function joinSubjects(n)
  if n == 1 then return subjects[1] end
  if n == 2 then return subjects[2] .. ", and " .. subjects[1] end
  return subjects[n] .. ", " .. joinSubjects(n - 1)
end
return {
  recite = function(start_verse, end_verse)
    local verses = setmetatable({}, { __index = table })
    for v = start_verse, end_verse do
      verses:insert(
        ("On the %s day of Christmas my true love gave to me: %s in a Pear Tree."):format(ordinals[v], joinSubjects(v)))
    end
    return verses
  end
}
