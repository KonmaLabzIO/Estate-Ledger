module Sales_Contract where

import Land_info


-- 3. Sales Contract
salesContract :: NFT -> String -> IO (NFT, Result)
salesContract (Fractionalized count) escrowWallet = do
    putStrLn "Enter buyer's name:"
    buyerName <- getLine
    putStrLn "Enter number of NFTs to buy:"
    nftToBuy <- readLn :: IO Int
    putStrLn "Enter buyer's receiving wallet address:"
    walletAddress <- getLine
    if nftToBuy <= count then do
        putStrLn "Payment verified!"
        putStrLn $ "Transferring " ++ show nftToBuy ++ " NFTs from " ++ escrowWallet ++ " to " ++ walletAddress
        let remainingNFTs = count - nftToBuy
        putStrLn $ "Remaining NFTs: " ++ show remainingNFTs
        return (Fractionalized remainingNFTs, "Sale confirmed for " ++ show nftToBuy ++ " NFTs to buyer " ++ buyerName)
    else do 
        putStrLn "Not enough NFTs available!"
        return (Fractionalized count, "Sale not completed due to insufficient NFTs")

salesContract Single escrowWallet = do
    putStrLn "Enter buyer's name:"
    buyerName <- getLine
    putStrLn "Enter buyer's receiving wallet address:"
    walletAddress <- getLine
    putStrLn "Payment verified!"
    putStrLn $ "Transferring the NFT from " ++ escrowWallet ++ " to " ++ walletAddress
    return (Single, "Sale confirmed of single NFT to buyer " ++ buyerName)