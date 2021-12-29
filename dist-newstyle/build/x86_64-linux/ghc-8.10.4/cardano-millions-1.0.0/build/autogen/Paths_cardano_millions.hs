{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_cardano_millions (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/node/.cabal/bin"
libdir     = "/home/node/.cabal/lib/x86_64-linux-ghc-8.10.4/cardano-millions-1.0.0-inplace"
dynlibdir  = "/home/node/.cabal/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/node/.cabal/share/x86_64-linux-ghc-8.10.4/cardano-millions-1.0.0"
libexecdir = "/home/node/.cabal/libexec/x86_64-linux-ghc-8.10.4/cardano-millions-1.0.0"
sysconfdir = "/home/node/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cardano_millions_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cardano_millions_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cardano_millions_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cardano_millions_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cardano_millions_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cardano_millions_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
