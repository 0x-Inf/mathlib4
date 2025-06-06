/-
Copyright (c) 2021 Yury Kudryashov. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Yury Kudryashov
-/
import Mathlib.Data.Finset.Option
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Lemmas about products and sums over finite sets in `Option α`

In this file we prove formulas for products and sums over `Finset.insertNone s` and
`Finset.eraseNone s`.
-/

open Function

namespace Finset

variable {α M : Type*} [CommMonoid M]

@[to_additive (attr := simp)]
theorem prod_insertNone (f : Option α → M) (s : Finset α) :
    ∏ x ∈ insertNone s, f x = f none * ∏ x ∈ s, f (some x) := by simp [insertNone]

@[to_additive]
theorem mul_prod_eq_prod_insertNone (f : α → M) (x : M) (s : Finset α) :
    x * ∏ i ∈ s, f i = ∏ i ∈ insertNone s, i.elim x f :=
  (prod_insertNone (fun i => i.elim x f) _).symm

@[to_additive]
theorem prod_eraseNone (f : α → M) (s : Finset (Option α)) :
    ∏ x ∈ eraseNone s, f x = ∏ x ∈ s, Option.elim' 1 f x := by
  classical calc
      ∏ x ∈ eraseNone s, f x = ∏ x ∈ (eraseNone s).map Embedding.some, Option.elim' 1 f x :=
        (prod_map (eraseNone s) Embedding.some <| Option.elim' 1 f).symm
      _ = ∏ x ∈ s.erase none, Option.elim' 1 f x := by rw [map_some_eraseNone]
      _ = ∏ x ∈ s, Option.elim' 1 f x := prod_erase _ rfl

end Finset
