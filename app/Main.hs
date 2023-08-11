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




-- Main function
main :: IO ()
main = do
    putStrLn "Enter land location:"
    loc <- getLine
    putStrLn "Enter land size (in square feet):"
    sz <- readLn :: IO Double
    putStrLn "Enter land price (Ada):"
    pr <- readLn :: IO Double
    putStrLn "Enter land owner's name:"
    owner <- getLine

    let landDetails = Land loc sz pr owner ""

    (result1, escrowWallet, landOwnerWallet) <- landAcquisitionContract landDetails
    putStrLn result1

    nft <- tokenizationContract landDetails escrowWallet landOwnerWallet
    case nft of
        Fractionalized count -> putStrLn $ show count ++ " fractional NFTs generated"
        Single -> putStrLn "Single NFT generated"

    (_, result2) <- salesContract nft escrowWallet
    putStrLn result2

    result3 <- landDevelopmentContract landDetails escrowWallet
    putStrLn result3

    commercialActivitiesContract escrowWallet

    putStrLn "Enter total profit generated from Commercial activities:"
    totalProfit <- readLn :: IO Double

    putStrLn "Enter count of investors:"
    investorCount <- readLn :: IO Int

    profitDistributionContract landOwnerWallet landOwnerWallet totalProfit investorCount