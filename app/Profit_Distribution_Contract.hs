module Profit_Distribution_Contract where

import Land_info


-- 6. Profit Distribution Contract
profitDistributionContract :: String -> String -> Double -> Int -> IO ()
profitDistributionContract landOwnerWallet _ totalProfit investorCount = do
    putStrLn "Enter wallet addresses of each investor:"
    investors <- collectInvestorInfo investorCount
    let profitPerRecipient = totalProfit / fromIntegral (investorCount + 1)
    putStrLn "Transferring profits to recipients..."
    let recipientWallets = landOwnerWallet : map snd investors
    transferProfits recipientWallets profitPerRecipient
    putStrLn "Profit distribution completed."
    putStrLn $ "Land owner's wallet (" ++ landOwnerWallet ++ ") status: Paid " ++ show profitPerRecipient ++ " ADA"
    where
        collectInvestorInfo :: Int -> IO [(String, String)]
        collectInvestorInfo 0 = return []
        collectInvestorInfo count = do
            putStrLn $ "Enter investor " ++ show (investorCount - count + 1) ++ "'s name:"
            investorName <- getLine
            putStrLn $ "Enter wallet address for investor " ++ show (investorCount - count + 1) ++ ":"
            investorWallet <- getLine
            rest <- collectInvestorInfo (count - 1)
            return $ (investorName, investorWallet) : rest
        transferProfits :: [String] -> Double -> IO ()
        transferProfits [] _ = return ()
        transferProfits (wallet : rest) amount = do
            putStrLn $ "Transferring profit to wallet address " ++ wallet
            putStrLn $ "Transferring " ++ show amount ++ " ADA"
            transferProfits rest amount