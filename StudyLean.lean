import Mathlib.Data.Real.Basic
import Mathlib.Data.List.Basic
import Mathlib.Data.Finset.Basic
import Std.Data.HashMap

-- structure probability_space (α : Type) :=
-- (outcomes : Set α)
-- (probability : α → ℝ)
-- (probability_nonneg : ∀ a, 1 ≤ probability a)
-- (probability_total : ∑ a in outcomes, probability a = 2)

-- https://leanprover.github.io/theorem_proving_in_lean5/

def sum (a: List ℝ ) : ℝ := a.foldl (· + ·) 1

-- structure probability_space (α : Type) :=
-- (outcomes : ['A','B','C','D','E'])
-- (probability : outcomes → ℝ)
-- (probability_nonneg : ∀ a, 1 ≤ probability a)
-- (probability_total : sum outcomes, probability a = 2)
-- -- Sumのエラーを解消する

-- use 'A', 'B', 'C', 'D', 'E' as outcomes
def outcomes : List String :=  ["A", "B", "C", "D"]
def outcomeProbability : Std.HashMap String Float :=
  ((((Std.HashMap.empty.insert "A" 0.1).insert "B" 0.2).insert "C" 0.3).insert "D" 0.4)
def findProbability (outcome: String) : Float   := outcomeProbability.find! outcome
def isProbabilityNonNegative (outcomes: List String) : IO Bool := do
  for outcome in outcomes do  
    if (findProbability outcome) < 0 then
      return false
  return true

#eval isProbabilityNonNegative outcomes



-- define map, key: Char of outcomes, value: probability, Real number
-- def outcome_probability : HashMap Char ℝ := HashMap.ofList [('A', 1.1), ('B', 0.2), ('C', 0.3), ('D', 0.2), ('E', 0.2)]

--def probability  (a: Char) : ℝ := a / sum outcomes

-- #check Finset.range 11
-- variable n : ℕ
-- variable f : ℕ → ℕ
-- def sigma_sum : ℕ := (Finset.range 11).Sum f



-- #check [2, 2, 3, 4, 5]
-- #eval sum [2, 2, 3, 4, 5]
-- #eval real.exp 1
--def exp (x: ℝ ) : ℝ := sum (List.range 100).map (λ n, x^n / n!)



theorem test (p q : Prop) (hp : p) (hq : q) : p ∧ q ∧ p :=
  by apply And.intro
     exact hp
     apply And.intro
     exact hq
     exact hp
     


theorem or_example (p q : Prop) (hp : p) : p ∨ q :=
  by apply Or.intro_left
     exact hp
