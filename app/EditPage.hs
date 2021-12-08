main :: IO ()

    main = do in <- getLine
                putStrLn in

writeFile :: FilePath -> String -> IO ()