module MyLib 
    (
       caesarCipher
    ,  caesarDecipher
    ) where
import Data.Char (chr, ord, isLower, isUpper)

shiftChar :: Int -> Char -> Char
shiftChar shift c
  | 'A' <= c && c <= 'Z' = chr $ (ord c - ord 'A' + shift) `mod` 26 + ord 'A'
  | 'a' <= c && c <= 'z' = chr $ (ord c - ord 'a' + shift) `mod` 26 + ord 'a'
  | otherwise = c

shiftString :: (Int -> Int) -> String -> [Int] -> String
shiftString _ [] _ = []
shiftString _ s [] = s
shiftString f s (n:ns) = shiftString f (map (shiftChar (f n)) s) ns

caesarCipher :: String -> [Int] -> String
caesarCipher s ns = shiftString id s ns

caesarDecipher :: String -> [Int] -> String
caesarDecipher s ns = shiftString (0 -) s ns


