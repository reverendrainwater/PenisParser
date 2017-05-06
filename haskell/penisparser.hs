import System.Directory
import System.Environment
import Text.Regex

-- This is silly
main :: IO()
main = let penis text = subRegex (mkRegex "\\S+") text "penis" in do
  args <- getArgs
  case args of
    [] -> putStrLn "i would like to humbly request that you provide me with a filename"
    (file:_) -> do
      fileExists <- doesFileExist file
      if fileExists
        then do
          contents <- readFile file
          length contents `seq` writeFile file (penis contents)
        else
          putStrLn "i would like to humbly request that you provide me with a legitimate filename"
