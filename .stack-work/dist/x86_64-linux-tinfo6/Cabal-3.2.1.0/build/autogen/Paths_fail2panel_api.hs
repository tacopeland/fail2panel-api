{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_fail2panel_api (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/bin"
libdir     = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/lib/x86_64-linux-ghc-8.10.6/fail2panel-api-0.1.0.0-5ONATf5WHWY56xOwWWBA5A"
dynlibdir  = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/lib/x86_64-linux-ghc-8.10.6"
datadir    = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/share/x86_64-linux-ghc-8.10.6/fail2panel-api-0.1.0.0"
libexecdir = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/libexec/x86_64-linux-ghc-8.10.6/fail2panel-api-0.1.0.0"
sysconfdir = "/home/timothy/prog/fail2panel-api/.stack-work/install/x86_64-linux-tinfo6/c92c6c9252ded2764067810df5f881b0d06775e7a4630d7476d4d8bef10fea0f/8.10.6/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fail2panel_api_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fail2panel_api_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fail2panel_api_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fail2panel_api_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fail2panel_api_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fail2panel_api_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
