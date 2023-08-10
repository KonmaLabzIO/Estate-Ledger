
module Land_info where

data Land = Land 
    { location :: String
    , size :: Double  -- Assuming size is in square feet for simplicity
    , price :: Double
    , landOwner :: String
    } deriving (Show)

type Params = Land
type Result = String