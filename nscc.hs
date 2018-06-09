import System.Environment
import System.IO
  
main = do
  args <- getArgs
  writeFile (head args) ("\    
	\    .globl _main\n\
	\_main:\n\
	\    movl    $"++ show 2 ++ ", %eax\n\
	\    ret\n\
	\")

