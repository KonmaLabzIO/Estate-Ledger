module LandAcquisition where

import System.IO (hFlush, stdout)

data Role = Role String deriving Show
data Party = Party Role | Account Integer deriving Show
data Token = Token String String deriving Show
data Amount = Amount Integer deriving Show
data Contract = Close 
              | Pay Party Party Token Amount Contract 
              | When [Case] Integer Contract deriving Show
data Action = Deposit Party Party Token Amount deriving Show
data Case = Case Action Contract deriving Show

deposit :: Party -> Party -> Token -> Amount -> Action
deposit from to token amount = Deposit from to token amount

pay :: Party -> Party -> Token -> Amount -> Contract -> Contract
pay from to token amount cont = Pay from to token amount cont

caseAction :: Action -> Contract -> Case
caseAction action cont = Case action cont

landlord, buyer, escrow :: Role
landlord = Role "Landlord"
buyer = Role "Buyer"
escrow = Role "Escrow"

getAmount :: IO Amount
getAmount = do
  putStr "Enter the agreed price for the land: "
  hFlush stdout
  price <- readLn
  return (Amount price)

getLandDetails :: IO Token
getLandDetails = do
  putStr "Enter the land size in square feet: "
  hFlush stdout
  landSize <- getLine
  putStr "Enter the land owner wallet address: "
  hFlush stdout
  landOwnerAddress <- getLine
  return (Token landSize landOwnerAddress)

getBuyerWallet :: IO Party
getBuyerWallet = do
  putStr "Enter the wallet address of the buyer: "
  hFlush stdout
  buyerAddress <- getLine
  return (Party (Role buyerAddress))

getNFTCount :: IO Integer
getNFTCount = do
  putStr "Enter the number of NFTs the buyer wants to purchase: "
  hFlush stdout
  nftCount <- readLn
  return nftCount

transferFunds :: Party -> Party -> Amount -> IO ()
transferFunds from to amount = putStrLn $ "Transferring " ++ show amount ++ " from " ++ show from ++ " to " ++ show to

contract :: IO Contract
contract = do
  agreedPrice <- getAmount
  landInfo <- getLandDetails
  let landId = landInfo
  let price = agreedPrice
  let squareFeet = case landId of
                     Token s _ -> read s :: Integer
  let pricePerSquareFeet = case price of
                             Amount p -> Amount (p `div` squareFeet)
  let totalNFTs = squareFeet
  createNFTs squareFeet totalNFTs pricePerSquareFeet
  buyerWallet <- getBuyerWallet
  nftCount <- getNFTCount
  let totalPrice = case pricePerSquareFeet of
                     Amount p -> Amount (p * nftCount)
  transferFunds buyerWallet (Party landlord) totalPrice
  return $ When [ 
      caseAction (deposit (Party buyer) (Party escrow) landId price)
                 (pay (Party escrow) (Party landlord) landId price Close)
      ] 
      10 
      Close

createNFTs :: Integer -> Integer -> Amount -> IO ()
createNFTs squareFeet count pricePerSquareFeet = do
  putStrLn $ "Creating " ++ show count ++ " NFTs for the land of " ++ show squareFeet ++ " square feet."
  putStrLn $ "Price per square foot for NFTs: " ++ show pricePerSquareFeet

main :: IO ()
main = do
  userContract <- contract
  print userContract