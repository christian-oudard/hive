module Hive where

import Data.List (nub, (\\))
import qualified Data.HashMap.Strict as M
import Math.Geometry.Grid
  ( Index
  , Direction
  , neighbours
  )

import Math.Geometry.Grid.Hexagonal2 (UnboundedHexGrid(..))


type Pos = Index UnboundedHexGrid
type Dir = Direction UnboundedHexGrid

data PieceType = Bee | Ant | Spider | Beetle | Grasshopper
  deriving (Eq, Show)
-- data Color = White | Black
data Piece = White PieceType | Black PieceType
  deriving (Eq, Show)

type Board = M.HashMap Pos Piece

emptyBoard :: Board
emptyBoard = M.empty

grid :: UnboundedHexGrid
grid = UnboundedHexGrid

neighbours' :: Pos -> [Pos]
neighbours' = neighbours grid

origin :: Pos
origin = (0, 0)

halo :: [Pos] -> [Pos]
halo ps = nub $ concatMap neighbours' ps \\ ps

freePlaces :: Board -> [Pos]
freePlaces board
  | M.null board  = [origin]
  | otherwise  = halo $ M.keys board
