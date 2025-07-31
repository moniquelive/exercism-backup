module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven : number
expectedMinutesInOven =
    40


preparationTimeInMinutes : number -> number
preparationTimeInMinutes layers =
    layers * 2


elapsedTimeInMinutes : number -> number -> number
elapsedTimeInMinutes layers timeSpentInOven =
    preparationTimeInMinutes layers + timeSpentInOven
