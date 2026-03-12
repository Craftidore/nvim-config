; rg probably isn't v15.0.0 but only needed for json ripgrep
{ 1 :chrisgrieser/nvim-rip-substitute
  :cmd :RipSubstitute
  :opts {}
  :keys
  [{ 1 :<leader>us
     2 (fn [] ((. (require :rip-substitute) :sub)))
     :mode [ :n :x ]
     :desc " rip substitute"}]}

