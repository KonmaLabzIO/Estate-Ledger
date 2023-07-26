module ProfitDistribution where

-- List of stakeholders with their token balances
stakeholders :: [(String, Integer)]
stakeholders = [("Investor1", 100), ("Investor2", 150), ("Investor3", 200)]

-- Total profits from property sales
totalProfits :: Integer
totalProfits = 10000  -- Replace this with the actual total profits

-- Calculate each stakeholder's share of profits based on their token holdings
calculateShares :: [(String, Double)]
calculateShares = let totalTokens = fromIntegral $ sum $ map snd stakeholders
                      individualShares = [(name, fromIntegral tokens / totalTokens) | (name, tokens) <- stakeholders]
                  in individualShares

-- Pay each stakeholder their share of profits
payProfits :: [(String, Double)] -> [(String, Double)]
payProfits shares = [(name, share * fromIntegral totalProfits) | (name, share) <- shares]

main :: IO ()
main = do
    let shares = calculateShares
    let payments = payProfits shares
    putStrLn "Stakeholder Shares:"
    mapM_ (\(name, share) -> putStrLn $ name ++ ": " ++ show share) shares
    putStrLn "Stakeholder Payments:"
    mapM_ (\(name, payment) -> putStrLn $ name ++ ": " ++ show payment) payments
