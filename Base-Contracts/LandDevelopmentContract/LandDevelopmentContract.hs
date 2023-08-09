module LandDevelopmentContract where

data LandDevelopmentContract = LandDevelopmentContract
    { owner :: String
    , projectPlan :: String
    , budget :: Integer
    , timeline :: Integer
    , projectInitiated :: Bool
    } deriving (Show)

-- Create a new land development contract
createContract :: String -> LandDevelopmentContract
createContract _owner = 
    LandDevelopmentContract
        { owner = _owner
        , projectPlan = ""
        , budget = 0
        , timeline = 0
        , projectInitiated = False
        }

-- Set project details
setProjectDetails :: LandDevelopmentContract -> String -> Integer -> Integer -> LandDevelopmentContract
setProjectDetails contract _projectPlan _budget _timeline =
    contract
        { projectPlan = _projectPlan
        , budget = _budget
        , timeline = _timeline
        }

-- Initiate the project on the blockchain
initiateOnBlockchain :: LandDevelopmentContract -> LandDevelopmentContract
initiateOnBlockchain contract =
    if projectInitiated contract
        then contract
        else contract { projectInitiated = True }

-- Example usage
main :: IO ()
main = do
    putStrLn "Enter owner address:"
    ownerAddress <- getLine

    let contract = createContract ownerAddress

    putStrLn "Enter project plan:"
    plan <- getLine

    putStrLn "Enter budget:"
    budgetStr <- getLine
    let budgetAmount = read budgetStr :: Integer

    putStrLn "Enter timeline:"
    timelineStr <- getLine
    let timelineAmount = read timelineStr :: Integer

    let contractWithDetails = setProjectDetails contract plan budgetAmount timelineAmount

    putStrLn "Recorded project details on the blockchain."

    let contractWithInitiation = initiateOnBlockchain contractWithDetails

    putStrLn "\nLand Development Contract:"
    putStrLn $ "Owner: " ++ owner contractWithInitiation
    putStrLn $ "Project Plan: " ++ projectPlan contractWithInitiation
    putStrLn $ "Budget: " ++ show (budget contractWithInitiation)
    putStrLn $ "Timeline: " ++ show (timeline contractWithInitiation)
    putStrLn $ "Project Initiated: " ++ show (projectInitiated contractWithInitiation)
