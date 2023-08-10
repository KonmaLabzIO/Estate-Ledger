
module Commercial_Activities_Contract where
import Land_info

-- 5. Commercial Activities Contract
commercialActivitiesContract :: Result -> IO Result
commercialActivitiesContract prevResult = do
    putStrLn $ "Starting commercial activities on: " ++ prevResult
    return ("Commercial activities completed on: " ++ prevResult)