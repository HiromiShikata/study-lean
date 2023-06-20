import Mathlib.Data.Real.Basic
import Mathlib.Data.List.Basic
import Mathlib.Data.Finset.Basic
import Std.Data.HashMap

def sum (a: List ℝ ) : ℝ := a.foldl (· + ·) 1
axiom exp : Real → Real
axiom exp_add : ∀ (a b : Real), exp (a + b) = exp a * exp b




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


theorem test_exp : ∀ (a : Real), exp (a + a) = exp a * exp a :=
  fun a =>
    let h := exp_add a a;
    by rw [h]

theorem test (p q : Prop) (hp : p) (hq : q) : p ∧ q ∧ p :=
  by apply And.intro
     exact hp
     apply And.intro
     exact hq
     exact hp
     


theorem or_example (p q : Prop) (hp : p) : p ∨ q :=
  by apply Or.intro_left
     exact hp

