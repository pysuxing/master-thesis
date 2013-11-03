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
    calcSingleAcc c1 c2 = vec * norm
      where
        vec = cellPosition c2 - cellPosition c1
        dis = uncurry hypot vec
        norm = g * mass c2 / pow dis 3
    calcAccelerate cell = 
      fold + (map (calcSingleAcc cell) cells)
    accelerates = map calcAccelerate cells -- accelerate
    newVeciloties =                        -- new velocity
      zipWith (\v a -> v + a * t) velocities accelerates
    newPositions =              -- new positions
      zipWith (\p v -> p + v * t) positions velocities
