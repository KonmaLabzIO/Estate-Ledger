module TokenDistribution where

import qualified Data.Map as Map

type Address = String
type Amount = Integer

data TokenContract = TokenContract
    { totalSupply :: Amount
    , balances :: Map.Map Address Amount
    } deriving (Show)

-- Create a new token contract with an initial supply
createTokenContract :: Amount -> TokenContract
createTokenContract initialSupply = TokenContract
    { totalSupply = initialSupply
    , balances = Map.singleton "ContractCreatorAddress" initialSupply
    }

-- Mint new tokens and distribute them among the recipients
mintAndDistributeTokens :: TokenContract -> [(Address, Amount)] -> TokenContract
mintAndDistributeTokens contract [] = contract
mintAndDistributeTokens contract ((recipient, amount):rest)
    | amount <= 0 = mintAndDistributeTokens contract rest  -- Ensure non-negative amount
    | otherwise =
        let updatedBalance = amount + (Map.findWithDefault 0 recipient (balances contract))
            updatedBalances = Map.insert recipient updatedBalance (balances contract)
            updatedTotalSupply = totalSupply contract + amount
            updatedContract = contract { totalSupply = updatedTotalSupply, balances = updatedBalances }
        in mintAndDistributeTokens updatedContract rest

-- Function to read a list of recipient addresses and corresponding token amounts
readRecipientsAndAmounts :: Int -> IO [(Address, Amount)]
readRecipientsAndAmounts n = do
    putStrLn "Enter recipient addresses and corresponding token amounts:"
    readRecipientsAndAmounts' n []

readRecipientsAndAmounts' :: Int -> [(Address, Amount)] -> IO [(Address, Amount)]
readRecipientsAndAmounts' 0 acc = return $ reverse acc
readRecipientsAndAmounts' remaining acc = do
    input <- getLine
    case words input of
        [recipient, amountStr] -> do
            let amount = read amountStr :: Amount
            readRecipientsAndAmounts' (remaining - 1) ((recipient, amount) : acc)
        _ -> do
            putStrLn "Invalid input. Please enter in the format: 'recipient_address amount'."
            readRecipientsAndAmounts' remaining acc

-- Example usage
main :: IO ()
main = do
    putStrLn "Enter the initial token supply:"
    initialSupplyStr <- getLine
    let initialSupply = read initialSupplyStr :: Amount
    let contract = createTokenContract initialSupply

    putStrLn "Enter the number of recipients:"
    numRecipientsStr <- getLine
    let numRecipients = read numRecipientsStr :: Int

    recipientsAndAmounts <- readRecipientsAndAmounts numRecipients
    let updatedContract = mintAndDistributeTokens contract recipientsAndAmounts

    putStrLn $ "Initial Contract: " ++ show contract
    putStrLn $ "Updated Contract: " ++ show updatedContract
