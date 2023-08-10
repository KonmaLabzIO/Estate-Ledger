module Tokenization_Contract where

import Land_info

-- 2. Tokenization Contract
tokenizationContract :: Params -> IO Int
tokenizationContract land = do
    let nftCount = round (size land)  -- Assuming each NFT represents      1 square foot
    putStrLn $ "Generating " ++ show nftCount ++ " NFTs for the land at " ++ location land
    return nftCount