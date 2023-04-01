module Main where

import qualified MyLib (someFunc, encrypt, decrypt)

main :: IO ()
main = do
  let input = "HEllO WORLD"
  let shift = 3
  let encrypted = MyLib.encrypt shift input
  putStrLn $ "Original text: " ++ input
  putStrLn $ "Encrypted text: " ++ encrypted 

  putStrLn $ "Decrypting..."
  let unshift = 26 - shift
  let decrypted = MyLib.decrypt unshift encrypted
  putStrLn $ "Decrypted text: " ++ decrypted 
