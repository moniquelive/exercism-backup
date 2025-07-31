module LuigisLusciousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : number -> number -> number
remainingTimeInMinutes numberOfLayers whenStartedCooking =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            2 * numberOfLayers
    in
    preparationTimeInMinutes + expectedMinutesInOven - whenStartedCooking
