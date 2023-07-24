{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString (ByteString)

-- Token details
data Token = Token
  { tokenId :: Int,
    tokenName :: String
  }
  deriving (Show)

-- Address details
data Address = Address
  { 
    addr :: String
  }
  deriving (Show, Eq) -- Adding Eq instance for Address type

-- Buyer and seller details
data Party = Party
  { partyId :: Int,
    partyName :: String,
    partyAddress :: Address
  }
  deriving (Show)

-- Trade details
data Trade = Trade
  { tradeToken :: Token,
    tradeBuyer :: Party,
    tradeSeller :: Party,
    tradePrice :: Float
  }
  deriving (Show)

-- Contract function
tradeTokens :: Trade -> IO ()
tradeTokens trade = do
  let buyer = tradeBuyer trade
      seller = tradeSeller trade
      tokens = tradeToken trade
      price = tradePrice trade

  -- Verify the trade details
  case validateTrade trade of
    Left errorMsg -> putStrLn $ "Trade validation failed: " ++ errorMsg
    Right _ -> do
      -- Transfer tokens from the seller to the buyer
      transferTokens tokens seller buyer

      -- Trigger payment to the seller
      makePayment seller price

-- Function to validate the trade details
validateTrade :: Trade -> Either String ()
validateTrade trade
  | tradePrice trade <= 0 = Left "Invalid trade price"
  | partyAddressEquals (tradeBuyer trade) (tradeSeller trade) = Left "Buyer and seller cannot have the same address"
  | otherwise = Right ()

-- Helper function to check if addresses are equal
partyAddressEquals :: Party -> Party -> Bool
partyAddressEquals p1 p2 = partyAddress p1 == partyAddress p2

-- Function to transfer tokens from seller to buyer
transferTokens :: Token -> Party -> Party -> IO ()
transferTokens token seller buyer = do
  putStrLn $ "Transferring token " ++ show (tokenId token) ++ " from " ++ partyName seller ++ " to " ++ partyName buyer

-- Function to make payment to the seller
makePayment :: Party -> Float -> IO ()
makePayment seller price = do
  putStrLn $ "Making payment of $" ++ show price ++ " to " ++ partyName seller

-- Example usage
main :: IO ()
main = do
  let token = Token 1 "Property Development Stake"
      buyerAddress = Address  "0xb26f45hd"
      sellerAddress = Address  "0xb2hdh4hd"
      buyer = Party 1 "Buyer" buyerAddress
      seller = Party 2 "Seller" sellerAddress
      trade = Trade token buyer seller 1000.0

  tradeTokens trade
