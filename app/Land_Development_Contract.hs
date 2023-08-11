module Land_Development_Contract where

import Land_info


-- 4. Land Development Contract
landDevelopmentContract :: Params -> String -> IO Result
landDevelopmentContract land escrowWallet = do
    putStrLn "Enter project plan:"
    plan <- getLine
    putStrLn "Enter project budget (ada):"
    budget <- getLine
    putStrLn "Enter project timeline (in months):"
    timeline <- getLine
    putStrLn "Escrow account holder, choose your option:"
    putStrLn "1. Initiate"
    putStrLn "2. Cancel"
    choice <- getLine
    case choice of
        "1" -> do
            putStrLn "Recording project details on the blockchain..."
            putStrLn $ "Project plan: " ++ plan
            putStrLn $ "Budget: " ++ budget
            putStrLn $ "Timeline: " ++ timeline
            return ("Confirmation of project initiation. Escrow account (" ++ escrowWallet ++ ") chose to: Initiate")
        "2" -> return ("Cancellation of project initiation. Escrow account (" ++ escrowWallet ++ ") chose to: Cancel")
        _   -> return "Invalid choice!"