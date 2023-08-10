module Sales_Contract where

import Land_info


-- 3. Sales Contract
salesContract :: Int -> IO Int
salesContract availableNFTs = do
    putStrLn "Enter buyer's name:"
    buyerName <- getLine
    putStrLn "Enter number of NFTs to buy:"
    nftToBuy <- readLn :: IO Int
    putStrLn "Enter buyer's receiving wallet address:"
    walletAddress <- getLine
    if nftToBuy <= availableNFTs 
       then do
            -- Simulating payment verification and NFT transfer
            putStrLn "Payment verified!"
            putStrLn $ "Transferring " ++ show nftToBuy ++ " NFTs to "             ++ walletAddress
            putStrLn $ "Sale confirmed for " ++ show nftToBuy ++ "                 NFTs to buyer " ++ buyerName
            return (availableNFTs - nftToBuy)  -- Return remaining NFTs
       else do 
            putStrLn "Not enough NFTs available!"
            return availableNFTs  -- No NFTs sold, so we return the original count