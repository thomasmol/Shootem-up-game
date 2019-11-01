module Controller where

import Model
    
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import System.Random

-- | Handle one iteration of the game
-- move enemies ,add enemies, movebullets , player Input(checkPause, checkPlayerShoot, checkMove), enemyShoot, 
-- checkPlayerHit all bullets, checkEnemyHit all bullets ,removeDead, removeBullets that hit, 
step :: Float -> GameState -> IO GameState
step secs gstate =      return $ 
                        moveEnemies $
                        addEnemies  $
                        moveBullets $
                        enemyShoot  $
                        checkPlayerHit $
                        checkEnemyHit   $
                        removeDead  $
                        removeBullets gstate
                        




input :: Event -> GameState -> IO GameState
input e gstate = return (inputKey e gstate)

inputKey :: Event -> GameState -> GameState
inputKey (EventKey (SpecialKey c) Down _ _) (GameState player enemies bullets score ) | c == KeyUp = GameState player {positionY = positionY player + 10} enemies bullets score
                                                                      | c == KeyDown = GameState player {positionY = positionY player - 10} enemies bullets score

inputKey _ gstate = gstate -- Otherwise keep the same




moveEnemies :: GameState -> GameState
moveEnemies = undefined

addEnemies :: GameState -> GameState
addEnemies gstate = gstate {enemies = enemies gstate ++ [Enemy {enemyShape = circle 20, enemyPosX = 200, enemyPosY = 0, enemyHealth = 100 , enemySpeed = 10}]


                            }

moveBullets :: GameState -> GameState
moveBullets = undefined


enemyShoot  :: GameState -> GameState
enemyShoot  = undefined

checkPlayerHit  :: GameState -> GameState
checkPlayerHit  = undefined

checkEnemyHit   :: GameState -> GameState
checkEnemyHit   = undefined


removeDead  :: GameState -> GameState
removeDead  = undefined

removeBullets   :: GameState -> GameState
removeBullets   = undefined

