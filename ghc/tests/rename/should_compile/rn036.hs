-- !!! Checking that qualified method names are legal in instance body.
module ShouldSucceed where

import Prelude hiding (Eq, (==))
import Prelude as P (Eq,(==))

data Foo = Foo Int Integer

instance P.Eq Foo where
  (Foo a1 b1) P.== (Foo a2 b2) = a1 P.== a2 && b1 P.== b2



