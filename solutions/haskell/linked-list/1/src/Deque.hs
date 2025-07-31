module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Data.IORef
  ( IORef,
    modifyIORef,
    newIORef,
    readIORef,
    writeIORef,
  )

type Deque a = IORef [a]

mkDeque :: IO (Deque a)
mkDeque = newIORef []

pop :: Deque a -> IO (Maybe a)
pop deque = do
  lst <- readIORef deque
  if null lst
    then return Nothing
    else do
      writeIORef deque (tail lst)
      return $ Just (head lst)

push :: Deque a -> a -> IO ()
push deque x = modifyIORef deque (x :)

unshift :: Deque a -> a -> IO ()
unshift deque x = modifyIORef deque (++ [x])

shift :: Deque a -> IO (Maybe a)
shift deque = do
  lst <- readIORef deque
  if null lst
    then return Nothing
    else do
      writeIORef deque (init lst)
      return $ Just (last lst)
