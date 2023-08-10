module Profit_Distribution_Contract where

import Land_info


-- 6. Profit Distribution Contract
profitDistributionContract :: Result -> IO Result
profitDistributionContract prevResult = do
    putStrLn $ "Distributing profits from: " ++ prevResult
    return ("Profits distributed from: " ++ prevResult)