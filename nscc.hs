import System.Environment
import System.IO
import Text.Regex
 
main = do
  args <- getArgs
  let cFile = (head args)

  cContents <- readFile cFile
  let maybeRet = matchRegex (mkRegex "return ([0-9]+);") cContents
  case maybeRet of
    Nothing -> error $ "number not found"
    Just ret -> do 
      let assFile = (take ((length cFile) - 1) cFile) ++ "s"
      writeFile assFile ("\    
		\    .globl main\n\
		\main:\n\
		\    movl    $"++ (head ret) ++ ", %eax\n\
		\    ret\n\
		\")

