local ordinals = { "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" }
local subjects = { "twelve Drummers Drumming, ", "eleven Pipers Piping, ", "ten Lords-a-Leaping, ", "nine Ladies Dancing, ", "eight Maids-a-Milking, ", "seven Swans-a-Swimming, ", "six Geese-a-Laying, ", "five Gold Rings, ", "four Calling Birds, ", "three French Hens, ", "two Turtle Doves, and ", "a Partridge" }
local verse = "On the %s day of Christmas my true love gave to me: %s in a Pear Tree."
return {
  recite = function(start_verse, end_verse)
    local verses = setmetatable({}, { __index = table })
    for v = start_verse, end_verse do
      verses:insert(verse:format(ordinals[v], table.concat({ table.unpack(subjects, #subjects - v + 1, #subjects) })))
    end
    return verses
  end
}
