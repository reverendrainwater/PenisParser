import System.Environment
import Text.Regex

-- This is silly
main :: IO()
main = let penis text = subRegex (mkRegex "[a-zA-Z0-9]+") text "penis" in do
  args <- getArgs
  case args of
    [] -> error "i would like to humbly request that you provide me with a filename"
    (file:_) -> do
      contents <- readFile file
      length contents `seq` writeFile file (penis contents)
