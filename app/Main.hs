module Main where

import qualified MyLib (encrypt, decrypt)
import qualified Cli (Options(..), parseOptions)

main :: IO ()
main = do
  options <- Cli.parseOptions
  let input = Cli.input options
  let shift = Cli.shift options
  let operation = Cli.operation options

  case operation of
    "encrypt" -> do
      let encrypted = MyLib.encrypt shift input
      putStrLn $ "Original text " ++ input
      putStrLn $ "Encrypted text " ++ encrypted 
    "decrypt" -> do
      let decrypted = MyLib.decrypt shift input
      putStrLn $ "Original text " ++ input
      putStrLn $ "Encrypted text " ++ decrypted 
    _ -> putStrLn "Invalid operation: Please use 'encrypt' or 'decrypt'."

  
