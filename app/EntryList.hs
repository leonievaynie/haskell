module EntryList(
    readEntry
    ,writeEntry
)where 


import FilePath

readEntry :: FilePath -> IO EntryList 
readEntry file = do
    exits <- doesFileExist file
    if not exists then return []
    else do 
        content <- readFile file
        let entries = if null content then [] else (read content) 
        return $! entries

writeEntry :: FilePath -> EntryList IO ()
writeEntry file entries = writeFile file (show entries)
