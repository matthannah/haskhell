{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log
import Text.Read

-- Parse a line of text from a log file
-- Examples:
-- parseMessage "E 2 562 help help" == LogMessage (Error 2) 562 "help help"
-- parseMessage "I 29 la la la" == LogMessage Info 29 "la la la"
-- parseMessage "This is not in the right format" == Unknown "This is not in the right format"
parseMessage :: String -> LogMessage
parseMessage x = case (words x) of
  ("I":_) -> parseInfoMessage (words x)
  ("W":_) -> parseWarningMessage (words x)
  ("E":_) -> parseErrorMessage (words x)
  _ -> Unknown x

parseInfoMessage :: [String] -> LogMessage
parseInfoMessage (m:t:xs)
    | isValidTimeStamp t = LogMessage Info (read t :: Int) (unwords xs)
    | otherwise = Unknown (unwords (m:t:xs))
parseInfoMessage xs = Unknown (unwords xs)

parseWarningMessage :: [String] -> LogMessage
parseWarningMessage (m:t:xs)
  | isValidTimeStamp t = LogMessage Warning (read t :: Int) (unwords xs)
  | otherwise = Unknown (unwords (m:t:xs))
parseWarningMessage xs = Unknown (unwords xs)

parseErrorMessage :: [String] -> LogMessage
parseErrorMessage (m:l:t:xs)
  | (isValidTimeStamp t) && (isValidErrorLevel l) = LogMessage (Error (read l :: Int)) (read t :: Int) (unwords xs)
  | otherwise = Unknown (unwords (m:l:t:xs))
parseErrorMessage xs = Unknown (unwords xs)

isValidTimeStamp :: String -> Bool
isValidTimeStamp x = case (readMaybe x :: Maybe Int) of
  Nothing -> False
  Just _ -> True

isValidErrorLevel :: String -> Bool
isValidErrorLevel = isValidTimeStamp

-- Parse an entire log file
parse :: String -> [LogMessage]
parse l = parse' (lines l)
  where parse' :: [String] -> [LogMessage]
        parse' [] = []
        parse' (x:xs) = (parseMessage x) : (parse' xs)

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert message Leaf = Node Leaf message Leaf
insert lm1@(LogMessage _ t1 _) (Node left lm2@(LogMessage _ t2 _) right)
  | t1 < t2   = Node (insert lm1 left) lm2 right
  | otherwise = Node left lm2 (insert lm1 right)

build :: [LogMessage] -> MessageTree
build [] = Leaf
build (x:xs) = go xs (insert x Leaf)
  where
    go :: [LogMessage] -> MessageTree -> MessageTree
    go (logMessage:logMessages) mt = go logMessages (insert logMessage mt)
    go [] mt = mt

-- build [] = Leaf
-- build (x:xs) = insert x (build xs) <-- better

-- build xs = foldr insert Leaf xs <--- better
-- build = foldr insert Leaf <--- best solution

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left lm right) = (inOrder left) ++ (lm : (inOrder right))

whatWentWrong :: [LogMessage] -> [String] -- errors severity of 50 or greater
whatWentWrong xs = whatWentWrong' $ inOrder $ build xs
  where
    whatWentWrong' [] = []
    whatWentWrong' (y:ys)
      | relevantLogMessage y = (extractMessage y) : whatWentWrong' ys
      | otherwise = whatWentWrong' ys
    relevantLogMessage (LogMessage (Error level) _ _) = level >= 50
    relevantLogMessage _ = False
    extractMessage (LogMessage _ _ message) = message
