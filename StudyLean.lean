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

def outcomes : List String :=  ["A", "B", "C", "D"]
def outcomeProbability : Std.HashMap String Float :=
  ((((Std.HashMap.empty.insert "A" 0.1).insert "B" 0.2).insert "C" 0.3).insert "D" (0.4))
def findProbability (outcome: String) : Float   := outcomeProbability.find! outcome
def isProbabilityNonNegative (outcomes: List String) : Bool := 
  outcomes.all (fun outcome => (findProbability outcome) >= 0)
def isProbabilitySumOne (outcomes: List String) : Bool :=
  Float.abs (outcomes.foldl (fun sum outcome => sum + (findProbability outcome)) 0 - 1) < 0.0001
  

#eval isProbabilityNonNegative outcomes
#eval isProbabilitySumOne outcomes == true
#check isProbabilitySumOne outcomes

axiom exp が使えないか試す
-- https://chat.openai.com/share/2ac6c27b-38bf-4973-8ea5-c488c50b852c

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

