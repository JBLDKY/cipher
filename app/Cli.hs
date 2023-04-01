module Cli
    ( Options(..)
    , parseOptions
    ) where

import Options.Applicative
import Data.Semigroup ((<>))

data Options = Options
  { shift          :: [Int]
  , input          :: String
  , operation      :: String
  , customCipher   :: Maybe String
  , inputFile      :: Maybe FilePath
  , outputFile     :: Maybe FilePath
  } deriving (Show)

parseOptions :: IO Options
parseOptions = execParser (info (opts <**> helper) idm)
  where
    opts = Options
      <$> (some . option auto) ( long "shift"
                              <> short 's'
                              <> metavar "SHIFT"
                              <> help "Shift value(s) for the cipher")
      <*> strOption ( long "input"
                   <> short 'i'
                   <> metavar "INPUT"
                   <> help "Input string to be encrypted/decrypted")
      <*> strOption ( long "operation"
                   <> short 'o'
                   <> metavar "OPERATION"
                   <> help "Operation: 'encrypt' or 'decrypt'")
      <*> optional (strOption ( long "custom-cipher"
                              <> short 'c'
                              <> metavar "CUSTOM_CIPHER"
                              <> help "Custom cipher sequence (e.g., '3 5 2')"))
      <*> optional (strOption ( long "input-file"
                              <> short 'f'
                              <> metavar "INPUT_FILE"
                              <> help "Path to input file"))
      <*> optional (strOption ( long "output-file"
                              <> short 'u'
                              <> metavar "OUTPUT_FILE"
                              <> help "Path to output file"))
