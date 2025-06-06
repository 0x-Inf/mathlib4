import Mathlib.Util.Delaborators
import Mathlib.Data.Set.Lattice

section PiNotation
variable (P : Nat → Prop) (α : Nat → Type) (s : Set ℕ)

/-- info: ∀ x > 0, P x : Prop -/
#guard_msgs in
#check ∀ x, x > 0 → P x

/-- info: ∀ x > 0, P x : Prop -/
#guard_msgs in
#check ∀ x > 0, P x

/-- info: ∀ x ≥ 0, P x : Prop -/
#guard_msgs in
#check ∀ x, x ≥ 0 → P x

/-- info: ∀ x ≥ 0, P x : Prop -/
#guard_msgs in
#check ∀ x ≥ 0, P x

/-- info: ∀ x < 0, P x : Prop -/
#guard_msgs in
#check ∀ x < 0, P x

/-- info: ∀ x < 0, P x : Prop -/
#guard_msgs in
#check ∀ x, x < 0 → P x

/-- info: ∀ x ≤ 0, P x : Prop -/
#guard_msgs in
#check ∀ x ≤ 0, P x

/-- info: ∀ x ≤ 0, P x : Prop -/
#guard_msgs in
#check ∀ x, x ≤ 0 → P x

/-- info: ∀ x ∈ s, P x : Prop -/
#guard_msgs in
#check ∀ x ∈ s, P x

/-- info: ∀ x ∈ s, P x : Prop -/
#guard_msgs in
#check ∀ x, x ∈ s → P x

/-- info: ∀ x ∉ s, P x : Prop -/
#guard_msgs in
#check ∀ x ∉ s,P x

/-- info: ∀ x ∉ s, P x : Prop -/
#guard_msgs in
#check ∀ x, x ∉ s → P x

variable (Q : Set ℕ → Prop)

/-- info: ∀ t ⊆ s, Q t : Prop -/
#guard_msgs in
#check ∀ t ⊆ s, Q t

/-- info: ∀ t ⊆ s, Q t : Prop -/
#guard_msgs in
#check ∀ t, t ⊆ s → Q t

/-- info: ∀ t ⊂ s, Q t : Prop -/
#guard_msgs in
#check ∀ t ⊂ s, Q t

/-- info: ∀ t ⊂ s, Q t : Prop -/
#guard_msgs in
#check ∀ t, t ⊂ s → Q t

/-- info: ∀ t ⊇ s, Q t : Prop -/
#guard_msgs in
#check ∀ t ⊇ s, Q t

/-- info: ∀ t ⊇ s, Q t : Prop -/
#guard_msgs in
#check ∀ t, t ⊇ s → Q t

/-- info: ∀ t ⊃ s, Q t : Prop -/
#guard_msgs in
#check ∀ t ⊃ s, Q t

/-- info: ∀ t ⊃ s, Q t : Prop -/
#guard_msgs in
#check ∀ t, t ⊃ s → Q t

/-- info: (x : ℕ) → α x : Type -/
#guard_msgs in
#check (x : Nat) → α x

/-!
Disabling binder predicates
-/
/-- info: ∀ x > 0, P x : Prop -/
#guard_msgs in
#check ∀ x > 0, P x
/-- info: ∀ (x : ℕ), x > 0 → P x : Prop -/
#guard_msgs in
set_option pp.mathlib.binderPredicates false in
#check ∀ x > 0, P x

/-- info: ∃ x > 0, P x : Prop -/
#guard_msgs in
#check ∃ x > 0, P x
/-- info: ∃ x, x > 0 ∧ P x : Prop -/
#guard_msgs in
set_option pp.mathlib.binderPredicates false in
#check ∃ x > 0, P x

/-!
Opening the `PiNotation` namespace enables `Π` notation.
-/
open PiNotation

/-- info: Π (x : ℕ), α x : Type -/
#guard_msgs in
#check (x : Nat) → α x

/-- info: ∀ (x : ℕ), P x : Prop -/
#guard_msgs in
#check (x : Nat) → P x

/-!
Note that the implementation of the `Π` delaborator in `Mathlib/Util/Delaborators.lean`
does not (yet?) make use of binder predicates.
-/
/-- info: Π (x : ℕ), x > 0 → α x : Type -/
#guard_msgs in
#check Π x > 0, α x
/-- info: Π (x : ℕ), x > 0 → α x : Type -/
#guard_msgs in
set_option pp.mathlib.binderPredicates false in
#check Π x > 0, α x

end PiNotation

section UnionInter
variable (s : ℕ → Set ℕ) (u : Set ℕ) (p : ℕ → Prop)

/-- info: ⋃ n ∈ u, s n : Set ℕ -/
#guard_msgs in
#check ⋃ n ∈ u, s n

/-- info: ⋂ n ∈ u, s n : Set ℕ -/
#guard_msgs in
#check ⋂ n ∈ u, s n

end UnionInter

section CompleteLattice
/-- info: ⨆ i ∈ Set.univ, (i = i) : Prop -/
#guard_msgs in
#check ⨆ (i : Nat) (_ : i ∈ Set.univ), (i = i)

/-- info: ⨅ i ∈ Set.univ, (i = i) : Prop -/
#guard_msgs in
#check ⨅ (i : Nat) (_ : i ∈ Set.univ), (i = i)

end CompleteLattice

section existential

/-- info: ∃ i ≥ 3, i = i : Prop -/
#guard_msgs in
#check ∃ (i : Nat), i ≥ 3 ∧ i = i

/-- info: ∃ i > 3, i = i : Prop -/
#guard_msgs in
#check ∃ (i : Nat), i > 3 ∧ i = i

/-- info: ∃ i ≤ 3, i = i : Prop -/
#guard_msgs in
#check ∃ (i : Nat), i ≤ 3 ∧ i = i

/-- info: ∃ i < 3, i = i : Prop -/
#guard_msgs in
#check ∃ (i : Nat), i < 3 ∧ i = i

variable (s : Set ℕ) (P : ℕ → Prop) (Q : Set ℕ → Prop)

/-- info: ∃ x ∉ s, P x : Prop -/
#guard_msgs in
#check ∃ x ∉ s, P x

/-- info: ∃ x ∉ s, P x : Prop -/
#guard_msgs in
#check ∃ x, x ∉ s ∧ P x

variable (Q : Set ℕ → Prop)

/-- info: ∃ t ⊆ s, Q t : Prop -/
#guard_msgs in
#check ∃ t ⊆ s, Q t

/-- info: ∃ t ⊆ s, Q t : Prop -/
#guard_msgs in
#check ∃ t, t ⊆ s ∧ Q t

/-- info: ∃ t ⊂ s, Q t : Prop -/
#guard_msgs in
#check ∃ t ⊂ s, Q t

/-- info: ∃ t ⊂ s, Q t : Prop -/
#guard_msgs in
#check ∃ t, t ⊂ s ∧ Q t

/-- info: ∃ t ⊇ s, Q t : Prop -/
#guard_msgs in
#check ∃ t ⊇ s, Q t

/-- info: ∃ t ⊇ s, Q t : Prop -/
#guard_msgs in
#check ∃ t, t ⊇ s ∧ Q t

/-- info: ∃ t ⊃ s, Q t : Prop -/
#guard_msgs in
#check ∃ t ⊃ s, Q t

/-- info: ∃ t ⊃ s, Q t : Prop -/
#guard_msgs in
#check ∃ t, t ⊃ s ∧ Q t

/-- info: ∃ n k, n = k : Prop -/
#guard_msgs in
#check ∃ n k, n = k

/-- info: ∃ n k, n = k : Prop -/
#guard_msgs in
#check ∃ n, ∃ k, n = k

section merging

/-- info: ∃ (_ : True), True : Prop -/
#guard_msgs in #check ∃ (_ : True), True

/-- info: ∃ (_ : True), ∃ x, x = x : Prop -/
#guard_msgs in #check ∃ (_ : True) (x : Nat), x = x

/-- info: ∃ (_ : True), ∃ x y, x = y : Prop -/
#guard_msgs in #check ∃ (_ : True) (x y : Nat), x = y

/-- info: ∃ (_ : True) (_ : False), True : Prop -/
#guard_msgs in #check ∃ (_ : True) (_ : False), True

set_option pp.funBinderTypes true in
/-- info: ∃ (x : ℕ) (x : ℕ), True : Prop -/
#guard_msgs in #check ∃ (_ : Nat) (_ : Nat), True

end merging

end existential

section prod

variable (x : ℕ × ℕ)

/-- info: x.1 : ℕ -/
#guard_msgs in
#check x.1

variable (p : (ℕ → ℕ) × (ℕ → ℕ))

/-- info: p.1 22 : ℕ -/
#guard_msgs in
#check p.1 22

set_option pp.numericProj.prod false in
/-- info: x.fst : ℕ -/
#guard_msgs in
#check x.1

set_option pp.numericProj.prod false in
/-- info: x.snd : ℕ -/
#guard_msgs in
#check x.2

set_option pp.explicit true in
/-- info: @Prod.fst Nat Nat x : Nat -/
#guard_msgs in
#check x.1

set_option pp.explicit true in
/-- info: @Prod.snd Nat Nat x : Nat -/
#guard_msgs in
#check x.2

set_option pp.fieldNotation false in
/-- info: Prod.fst x : ℕ -/
#guard_msgs in
#check x.1

set_option pp.fieldNotation false in
/-- info: Prod.snd x : ℕ -/
#guard_msgs in
#check x.2
end prod
