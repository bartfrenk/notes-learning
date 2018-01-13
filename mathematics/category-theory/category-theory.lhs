
> {-# LANGUAGE MultiParamTypeClasses #-}
> {-# LANGUAGE NoImplicitPrelude #-}
> {-# LANGUAGE TypeSynonymInstances #-}
> {-# LANGUAGE FlexibleInstances #-}
> module Category where

> import qualified Prelude as P
> import Prelude ((.))
> import Control.Monad ((>=>))

> class Category hom where
>   id :: hom a a
>   compose :: hom a b -> hom b c -> hom a c

> instance Category (->) where
>   id = P.id
>   compose f g = g . f

> data Kleisli m a b = Kleisli (a -> m b)

> instance (P.Monad m) => Category (Kleisli m) where
>   id = Kleisli P.pure
>   compose (Kleisli f) (Kleisli g)  = Kleisli (f >=> g)

> data Isomorphism hom a b = Isomorphism (hom a b) (hom b a)

> class Functor hom hom' f where
>   fmap :: hom a b -> hom' (f a) (f b)

> data Id a = Id { unId :: a }

> instance (P.Monad m) => Functor (->) (Kleisli m) Id where
>   fmap f = Kleisli (P.return . Id . f . unId)
