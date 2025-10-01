(local vim _G.vim)
(local vim _G.vim)
; paths to check for project.godot file, must start and end in slash
(local paths-to-check [:/ :/../])
(local cwd (vim.uv.cwd))

(fn file-exists? [path]
  (local stat-file (vim.uv.fs_stat path))
  ; and to coerce an object/nil to bool
  (or (and stat-file true) false))

(local godot-project-path
  (accumulate [found nil
               _ path (pairs paths-to-check)
               &until found]
      (if (file-exists? (.. cwd path :project.godot))
        (.. cwd path)
        found)))


(when godot-project-path
  (local server-path (.. godot-project-path :/server.pipe))
  (local is-server-running (file-exists? server-path))
  (when (not is-server-running)
      (vim.notify "Server started automatically")
      (vim.fn.serverstart server-path)))
