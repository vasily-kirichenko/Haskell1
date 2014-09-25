module Paths_Haskell1 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/kot/.cabal/bin"
libdir     = "/home/kot/.cabal/lib/Haskell1-0.1/ghc-7.6.3"
datadir    = "/home/kot/.cabal/share/Haskell1-0.1"
libexecdir = "/home/kot/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "Haskell1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Haskell1_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Haskell1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Haskell1_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
