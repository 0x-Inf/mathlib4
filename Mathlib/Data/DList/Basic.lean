/-
Copyright (c) 2018 Simon Hudon. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Simon Hudon
-/
import Mathlib.Data.DList.Defs
import Mathlib.Tactic.TypeStar

/-!
# Difference list

This file provides a few results about `DList`, which is defined in `Batteries`.

A difference list is a function that, given a list, returns the original content of the
difference list prepended to the given list. It is useful to represent elements of a given type
as `a₁ + ... + aₙ` where `+ : α → α → α` is any operation, without actually computing.

This structure supports `O(1)` `append` and `push` operations on lists, making it
useful for append-heavy uses such as logging and pretty printing.
-/

namespace Batteries

/-- Concatenates a list of difference lists to form a single difference list. Similar to
`List.join`. -/
def DList.join {α : Type*} : List (DList α) → DList α
  | [] => DList.empty
  | x :: xs => x ++ DList.join xs

@[simp]
theorem DList_singleton {α : Type*} {a : α} : DList.singleton a = DList.lazy_ofList [a] :=
  rfl

@[simp]
theorem DList_lazy {α : Type*} {l : List α} : DList.lazy_ofList l = Batteries.DList.ofList l :=
  rfl

end Batteries
