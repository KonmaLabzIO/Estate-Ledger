module Upgrade_Contract where
import Land_info


-- 8. Upgrade Contract
upgradeContract :: Result -> IO Result
upgradeContract prevResult = do
    putStrLn $ "Upgrading system based on: " ++ prevResult
    return ("Upgrade completed using info from: " ++ prevResult)