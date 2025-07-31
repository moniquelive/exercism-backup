type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergenScore(allergen: Allergen): int =
  1 shl ord(allergen)

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  (score and allergenScore(allergen)) != 0

proc allergies*(score: int): set[Allergen] =
  for allergen in Allergen:
    if isAllergicTo(score, allergen):
      result.incl(allergen)