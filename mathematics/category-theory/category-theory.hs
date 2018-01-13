
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeSynonymInstances #-}
module Category where

import qualified Prelude as P
import Control.Monad ((>=>))

class Category hom where
  id :: hom a a
  compose :: hom a b -> hom b c -> hom a c

instance Category (->) where
  id = P.id
  compose f g = g P.. f

data Kleisli m a b = Kleisli { getMap :: a -> m b }

instance (P.Monad m) => Category (Kleisli m) where
  id = Kleisli P.pure
  compose f g = Kleisli (getMap f >=> getMap g)

data Isomorphism hom a b = Isomorphism (hom a b) (hom b a)

class Functor hom hom' f where
  fmap :: hom a b -> hom (f a) (f b)
