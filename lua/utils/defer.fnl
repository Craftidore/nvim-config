(local M {})
(local vim _G.vim)
(fn verbose [msg]
  (var toprint nil)
  (when vim.g.defer_verbose
    (if (= (type msg) :string)
      (set toprint msg)
      (set toprint (vim.inspect msg)))
    (vim.print toprint)))

(set M._deferred { :generic {} })


(fn M.add_deferred [func ?label]
  (var label ?label)
  (when (= label nil)
   (set label :generic))
 (when (= (. M._deferred label) nil)
   (tset M._deferred label {}))
 (if (= (. M._deferred label) :finished)
     (do (verbose (.. "running " (vim.inspect func) " immediately; " (vim.inspect label) " executed"))
         (func))
     (do (verbose (.. "adding fn " (vim.inspect func) " to " (vim.inspect label)))
         (table.insert (. M._deferred label) func))))

(fn M.run [?label ?rerun]
  (var label ?label)
  (var rerun ?rerun)
  (when (= label nil)
    (set label :generic))
  (when (= rerun nil)
    (set rerun false))
  (if (or (= (. M._deferred label) nil) (= (. M._deferred label) :finished))
    (do (tset M._deferred label :finished)
        (verbose (.. "skipping " (vim.inspect label) " as its nil or finished")))
    (do (verbose (.. "running " (tostring (# (. M._deferred label))) " functions for " (vim.inspect label)))
        (each [_ v (ipairs (. M._deferred label))]
          (v))
        (when (not rerun)
          (tset M._deferred label :finished)))))

M

