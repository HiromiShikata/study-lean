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

require mathlib from git "https://github.com/leanprover-community/mathlib4.git"
  