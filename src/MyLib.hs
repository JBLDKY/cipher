module MyLib 
    (someFunc,
      shiftChar,
      encrypt,
      decrypt
      ) where
import Data.Char (chr, ord)

shiftChar :: Int -> Char -> Char
shiftChar shift c
  | 'A' <= c && c <= 'Z' = chr $ (ord c - ord 'A' + shift) `mod` 26 + ord 'A'
  | 'a' <= c && c <= 'z' = chr $ (ord c - ord 'a' + shift) `mod` 26 + ord 'a'
  | otherwise = c


encrypt :: Int -> String -> String
encrypt shift text = map (shiftChar shift) text

decrypt :: Int -> String -> String
decrypt shift text = map (shiftChar shift) text
