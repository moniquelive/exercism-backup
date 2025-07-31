module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    let earthYears = seconds / 31557600
        in case planet of
            Earth -> earthYears
            Jupiter -> earthYears / 11.862615
            Mars -> earthYears / 1.8808158
            Mercury -> earthYears / 0.2408467
            Neptune -> earthYears / 164.79132
            Saturn -> earthYears / 29.447498
            Uranus -> earthYears / 84.016846
            Venus -> earthYears / 0.61519726

