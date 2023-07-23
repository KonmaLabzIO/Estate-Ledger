{-# LANGUAGE OverloadedStrings #-}
module Main where
import Control.Monad (forM)
import System.Timeout (timeout)


data Party = Investor String | Midman | Developer deriving (Show, Eq)

data Transaction = Deposit Party Party Int | Pay Party Party Int deriving Show

data StageStatus = Complete | Incomplete deriving (Show, Eq)

data Choice = StageChoice Int | StageStatusChoice StageStatus deriving Show

data Event = TransactionEvent Transaction | ChoiceEvent Party Choice deriving Show

type Ledger = [Event]

investor :: Int -> Party
investor n = Investor $ "Investor" ++ show n

simulate :: Int -> Int -> StageStatus -> Ledger
simulate numInvestors stageChoice stageStatus =
    let investorDeposits = [TransactionEvent $ Deposit (investor n) Midman 100 | n <- [1..numInvestors]]
        developerChoice = [ChoiceEvent Developer $ StageChoice stageChoice]
        midmanChoice = [ChoiceEvent Midman $ StageStatusChoice stageStatus]
        payment = if stageStatus == Complete
            then [TransactionEvent $ Pay Midman Developer 50]
            else []
    in investorDeposits ++ developerChoice ++ midmanChoice ++ payment

main :: IO ()
main = do
    putStrLn "Enter the number of investors:"
    numInvestorsStr <- getLine
    let numInvestors = read numInvestorsStr :: Int

    investors <- forM [1..numInvestors] $ \n -> do
        let investorName = "Investor" ++ show n
        putStrLn $ investorName ++ " - Enter the deposit amount for this investor:"
        investorDeposit <- getLine
        return (investorName, investorDeposit)
    print investors  -- prints all investor names and their deposit amounts

    putStrLn "Enter stage number (1 to 5) within 60 seconds:"
    maybeStageStr <- timeout 60000000 getLine
    case maybeStageStr of
        Nothing -> do
            putStrLn "You didn't enter the stage number within 60 seconds. The contract won't proceed."
            return ()
        Just stageStr -> do
            let stageChoice = read stageStr :: Int

            putStrLn "Enter stage status (Complete/Incomplete):"
            statusStr <- getLine
            let stageStatus = if statusStr == "Complete" then Complete else Incomplete

            print $ simulate numInvestors stageChoice stageStatus