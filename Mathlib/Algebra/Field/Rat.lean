/-
Copyright (c) 2019 Johannes Hölzl. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Johannes Hölzl, Mario Carneiro
-/
import Mathlib.Algebra.Field.Defs
import Mathlib.Data.NNRat.Defs

/-!
# The rational numbers form a field

This file contains the field instance on the rational numbers.

See note [foundational algebra order theory].

## TODO

Move the `Semifield ℚ≥0` instance here. This will involve proving it by hand rather than relying on
the `Nonneg` machinery.

## Tags

rat, rationals, field, ℚ, numerator, denominator, num, denom
-/

namespace Rat

instance instField : Field ℚ where
  __ := commRing
  __ := commGroupWithZero
  nnqsmul := _
  nnqsmul_def := fun _ _ => rfl
  qsmul := _
  qsmul_def := fun _ _ => rfl
  nnratCast_def q := by
    rw [← NNRat.den_coe, ← Int.cast_natCast q.num, ← NNRat.num_coe]; exact(num_div_den _).symm
  ratCast_def _ := (num_div_den _).symm

/-!
### Extra instances to short-circuit type class resolution

These also prevent non-computable instances being used to construct these instances non-computably.
-/

instance instDivisionRing : DivisionRing ℚ := inferInstance

end Rat
