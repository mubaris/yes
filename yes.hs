import System.Environment
import System.Exit

main = getArgs >>= parse

parse :: [String] -> IO b
parse [] = putStrLn "y" >> parse []
parse (a:_) = putStrLn a >> parse [a]
