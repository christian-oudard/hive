module Main where

import qualified Data.HashMap.Strict as M
import Hive
import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

main :: IO ()
main = defaultMain unitTests

unitTests =
  testGroup
    "Unit tests"
    [ testPlacePiece
    , testFreePlaces
    ]

testPlacePiece =
  testCase "Place a piece and check it was there" $
    assertEqual "" (Just (Black Bee)) (M.lookup origin b1)

testFreePlaces =
  testCase "Find free places" $
    assertEqual "" 6 (length (freePlaces b1))


-- Fixtures

b1 = M.insert origin (Black Bee) emptyBoard
