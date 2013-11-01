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
    positions = map cellPosition cells  -- original positions
    velocities = map cellVelocity cells -- original velocity
    calcDistanceSqure c1 c2 =
      squre xD + squre yD
      where
        xD = xPosition . cellPosition c1 - xPosition . cellPosition c2
        yD = yPosition . cellPosition c1 - yPosition . cellPosition c2
    calcSingleAcc c1 c2 =
      (g * mass c2) / calcDistanceSqure c1 c2
    calcAccelerate cell = 
      fold + (map (calcSingleAcc cell) cells)
    accelerates = map calcAccelerate cells -- accelerate
    newVeciloties =                        -- new velocity
      zipWith (\v a -> v + a * t) velocities accelerates
    newPositions =              -- new positions
      zipWith (\p v -> p + v * t) positions velocities
