module Land_Development_Contract where

import Land_info


-- 4. Land Development Contract
landDevelopmentContract :: Result -> IO Result
landDevelopmentContract prevResult = do
    putStrLn $ "Developing land from: " ++ prevResult
    return ("Development completed for: " ++ prevResult)