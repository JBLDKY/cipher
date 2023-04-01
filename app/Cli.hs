{-# LANGUAGE DeriveDataTypeable #-}
module Cli ( Options(..), parseOptions) where

import Options.Applicative

data Options = Options
  {
    shift :: Int
    , input :: String
    , operation :: String
  } deriving (Show)

parseOptions :: IO Options
parseOptions = execParser $ info (optionsParser <**> helper) description
  where
    description = fullDesc <> progDesc "A simple Caesar cipher CLI in Haskell"
    

optionsParser :: Parser Options
optionsParser = Options
  <$> option auto
    ( long "shift"
    <> short 's'
    <> metavar "SHIFT"
    <> help "Number of positions to shift the characters (0-25)" )
  <*> strOption 
    ( long "input"
    <> short 'i'
    <> metavar "INPUT"
    <> help "Input string to encrypt or decrypt" )
  <*> strOption
    ( long "operation"
    <> short 'o'
    <> metavar "OPERATION"
    <> help "Operation to perform: encrypt or decrypt" )
