return {
  { "junegunn/fzf", build = "./install --all", cmd = { "FZF" } },
  { "junegunn/fzf.vim", cmd = { "Rg", "Buffers", "Files", "GFiles", "History", "BLines", "Lines", "Ag" } },
}

