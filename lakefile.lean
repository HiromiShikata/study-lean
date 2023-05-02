import Lake
open Lake DSL

package «study-lean» {
  -- add package configuration options here
}

lean_lib «StudyLean» {
  -- add library configuration options here
}

@[default_target]
lean_exe «study-lean» {
  root := `Main
}

--require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "d14d735b5919dd1f87536d0a3347c039e632a408"
require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "master"
  