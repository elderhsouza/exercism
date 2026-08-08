module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

expectedMinutesInOven = 40
preparationTimeInMinutes layerCount = layerCount * 2
elapsedTimeInMinutes layerCount elapsedMinutes = preparationTimeInMinutes layerCount + elapsedMinutes
