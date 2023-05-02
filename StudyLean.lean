import Mathlib.Data.Real.Basic
import Mathlib.Data.List.Basic
--import Mathlib.Analysis.SpecialFunctions.ExpLog.Basic.lean
--import Mathlib.analysis.special_functions.exp_log
--.Analysis.Special_functions.Exp_log
--import Mathlib.lean3lib.init.default
--import Mathlib.Data.Real.CauSeq


def sum (a: List ℝ ) : ℝ := a.foldl (· + ·) 0

#check [1, 2, 3, 4, 5]

#eval sum [1, 2, 3, 4, 5]

-- #eval real.exp 1
--def exp (x: ℝ ) : ℝ := sum (List.range 100).map (λ n, x^n / n!)

