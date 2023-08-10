module Main where
import Land_Acquisition_Contract
import Land_Development_Contract
import Commercial_Activities_Contract
import Governance_Contract
import Profit_Distribution_Contract
import Sales_Contract
import Tokenization_Contract
import Upgrade_Contract
import Land_info




-- Main function to execute all contracts sequentially
main :: IO ()
main = do
    putStrLn "Enter land location:"
    loc <- getLine
    putStrLn "Enter land size (in square feet):"
    sz <- readLn :: IO Double
    putStrLn "Enter land price ($):"
    pr <- readLn :: IO Double
    putStrLn "Enter landowner name:"
    owner <- getLine

    let landDetails = Land loc sz pr owner

    result1 <- landAcquisitionContract landDetails
    putStrLn result1

    nftsGenerated <- tokenizationContract landDetails
    putStrLn $ "Total NFTs generated: " ++ show nftsGenerated

    remainingNFTs <- salesContract nftsGenerated
    putStrLn $ "Remaining NFTs after sale: " ++ show remainingNFTs

    -- ... [Calls to other smart contracts, followed by printing their results]