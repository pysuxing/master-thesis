export solveNBodyOneStep

data Position = Position { xPosition :: Float, 
                           yPosition :: Float }
data Velocity = Velocity { xVelocity :: Float,
                           yVelocity :: Float }
data Mass = Mass { mass :: Float }
data Cell = Cell { cellMass :: Mass,
                   cellPosition :: Position,
                   cellVelocity :: Velocity }

g :: Float
g = ...

solveNBodyOneStep :: Float -> [Cell] -> [Cell]
solveNBodyOneStep t cells = 
  zipWith3 Cell masses newPositions newVelocities
  where
    masses = map cellMass cells         -- original masses
    positions = map cellPosition cells  -- original positions
    velocities = map cellVelocity cells -- original velocity
    calcDistanceSqure c1 c2 =   -- square of euclidean distance
      pow xD 2 + pow yD 2
      where
        getXPos = xPosition . cellPosition
        getYPos = yPosition . cellPosition
        xD = getXPos c1 - getXPos c2
        yD = getYPos c1 - getYPos c2
    calcSingleAcc c1 c2 =
      (g * mass c2) / calcDistanceSquare c1 c2
    calcAccelerate cell = 
      fold + (map (calcSingleAcc cell) cells)
    accelerates = map calcAccelerate cells -- accelerate
    newVeciloties =                        -- new velocity
      zipWith (\v a -> v + a * t) velocities accelerates
    newPositions =              -- new positions
      zipWith (\p v -> p + v * t) positions velocities
