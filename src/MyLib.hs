module MyLib
    ( caesarCipher
    ) where

import Data.Char (chr, ord, isUpper, isLower)
import Data.Maybe (fromMaybe)

caesarCipher :: String -> Int -> String -> String
caesarCipher op shift = map shiftChar
  where
    shiftChar c
      | isUpper c = shiftOp (ord 'A') c
      | isLower c = shiftOp (ord 'a') c
      | otherwise = c
    shiftOp base c
      | op == "encrypt" = chr $ (ord c - base + shift) `mod` 26 + base
      | op == "decrypt" = chr $ (ord c - base - shift) `mod` 26 + base
      | otherwise = c
