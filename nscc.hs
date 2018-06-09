import System.Environment
import System.IO
  
main = do
  args <- getArgs
  let cFile = (head args)
  let assFile = (take ((length cFile) - 1) cFile) ++ "s"
  writeFile assFile ("\    
	\    .globl main\n\
	\main:\n\
	\    movl    $"++ show 2 ++ ", %eax\n\
	\    ret\n\
	\")

