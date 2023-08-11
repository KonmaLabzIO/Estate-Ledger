module Land_Development_Contract where

import Land_info


-- 4. Land Development Contract
landDevelopmentContract :: Params -> String -> IO Result
landDevelopmentContract land escrowWallet = do
    putStrLn "Enter project plan:"
    plan <- getLine
    putStrLn "Enter project budget (ada):"
    budget <- readLn :: IO Double
    putStrLn "Enter project timeline (in months):"
    timeline <- getLine
    putStrLn "Enter developer's wallet address:"
    developerWallet <- getLine
    putStrLn "Enter number of milestones required for the project:"
    milestones <- readLn :: IO Int
    milestoneResults <- collectMilestoneInfo milestones milestones
    putStrLn "Escrow account holder, choose your option:"
    putStrLn "1. Yes, Stage is confirmed. Release Fund"
    putStrLn "2. Cancel, Need Improvement"
    choice <- getLine
    case choice of
        "1" -> do
            let confirmedMilestones = filter (\(_, _, confirmed) -> confirmed) milestoneResults
                totalFunding = sum [budget / fromIntegral milestones | (_, _, confirmed) <- confirmedMilestones]
                remainingBudget = budget - totalFunding
                developerFunding = totalFunding / fromIntegral milestones
            putStrLn $ "Transferring " ++ show developerFunding ++ " ADA for each confirmed milestone to developer's wallet: " ++ developerWallet
            putStrLn $ "Transferred amount: " ++ show developerFunding ++ " ADA"
            putStrLn $ "Remaining amount in escrow wallet: " ++ show remainingBudget ++ " ADA"
            putStrLn "Milestones confirmed and funds released:"
            mapM_ (\(name, phase, _) -> putStrLn $ "Milestone: " ++ name ++ ", Phase: " ++ show phase) confirmedMilestones
            return "Stage confirmed and funds released."
        "2" -> return "Stage cancelled."
        _   -> return "Invalid choice!"
    where
        collectMilestoneInfo :: Int -> Int -> IO [(String, Int, Bool)]
        collectMilestoneInfo 0 _ = return []
        collectMilestoneInfo remaining total = do
            let current = total - remaining + 1
            putStrLn $ "Enter milestone " ++ show current ++ "'s name:"
            milestoneName <- getLine
            putStrLn $ "Enter milestone " ++ show current ++ "'s phase number:"
            phaseNumber <- readLn :: IO Int
            putStrLn "Confirm funding for this milestone (y/n):"
            fundingConfirmed <- getLine
            let confirmed = fundingConfirmed == "y"
            rest <- collectMilestoneInfo (remaining - 1) total
            return $ (milestoneName, phaseNumber, confirmed) : rest