{-# LANGUAGE DeriveDataTypeable, GeneralizedNewtypeDeriving #-}

module Oracles.ArgsHash (
    ArgsHashKey (..), askArgsHash, argsHashOracle
    ) where

import Development.Shake.Classes
import Base
import Expression
import Settings

newtype ArgsHashKey = ArgsHashKey Target
                      deriving (Show, Typeable, Eq, Hashable, Binary, NFData)

askArgsHash :: Target -> Action Int
askArgsHash = askOracle . ArgsHashKey

-- Oracle for storing per-target argument list hashes
argsHashOracle :: Rules ()
argsHashOracle = do
    addOracle $ \(ArgsHashKey target) -> hash <$> interpret target settings
    return ()
