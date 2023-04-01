module Main where

import MyLib (caesarDecipher, caesarCipher)
import Cli (Options(..), parseOptions)
import Data.List.Split (splitOn)

main :: IO ()
main = do
  options <- parseOptions

  let inputStr = input options
      op = operation options
      customShifts = case customCipher options of
                      Just s -> map read $ splitOn " " s :: [Int]
                      Nothing -> [shift options]

  let result = if op == "encrypt"
                  then caesarCipher inputStr customShifts
                  else caesarDecipher inputStr customShifts

  putStrLn result
