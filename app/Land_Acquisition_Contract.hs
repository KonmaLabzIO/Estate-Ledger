module Land_Acquisition_Contract where
import Land_info

-- 1. Land Acquisition Contract
landAcquisitionContract :: Params -> IO Result
landAcquisitionContract land = do
    putStrLn $ "Acquiring land at location: " ++ location land
    putStrLn $ "Size: " ++ show (size land) ++ " square feet"
    putStrLn $ "Price: $" ++ show (price land)
    putStrLn $ "From owner: " ++ landOwner land
    return ("Land acquisition confirmed for " ++ location land)