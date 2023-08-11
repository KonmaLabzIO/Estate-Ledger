module Land_Acquisition_Contract where
import Land_info

-- 1. Land Acquisition Contract
landAcquisitionContract :: Params -> IO (String, String, String)
landAcquisitionContract land = do
    putStrLn $ "Acquiring land at location: " ++ location land
    putStrLn $ "Size: " ++ show (size land) ++ " square feet"
    putStrLn $ "Price: ada" ++ show (price land)
    putStrLn $ "From owner: " ++ landOwner land
    putStrLn "Enter the escrow wallet address for the NFT:"
    escrowWallet <- getLine
    putStrLn "Enter the land owner's wallet address:"
    landOwnerWallet <- getLine
    putStrLn $ "Transferring land price from " ++ escrowWallet ++ " to " ++ landOwnerWallet
    putStrLn $ "Transferring ada" ++ show (price land) ++ " to land owner's wallet"
    putStrLn "Transfer complete."
    return ("Land acquisition confirmed for " ++ location land, escrowWallet, landOwnerWallet)