module Main where

import MyLib (caesarCipher)
import Cli (Options(..), parseOptions)
import Data.List.Split (splitOn)

main :: IO ()
main = do
  options <- parseOptions
  let op = operation options
      shifts = case customCipher options of
                 Just s  -> map read (splitOn " " s)
                 Nothing -> if null (shift options) then [0] else shift options
      inputStr = input options
      output = foldl (\acc shift -> caesarCipher op shift acc) inputStr shifts
  putStrLn $ "result: " ++ output
