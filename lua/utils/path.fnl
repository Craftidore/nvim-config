(local vim _G.vim)
(local path-sep (do (local first-path-char (: (vim.fn.stdpath :config) :sub 1 1))
              (if (~= first-path-char :/) "\\" :/)))
(local remove-prefix (fn [path prefix]
      (: path :sub (+ (# prefix) 2))))

(local remove-suffix (fn [path suffix]
      (: path :gsub (.. suffix :$) "")))

(local join-paths (fn [...]
    (vim.fn.join [...] path-sep)))

(local glob-path (fn [path glob]
      (vim.fn.globpath path glob false true)))

(local get-filename (fn [path]
    (if (= path-sep :/)
      (: path :sub (+ (string.find path "/[^/]*$") 1))
      (: path :sub (+ (string.find path "\\[^\\]*$") 1)))))

{ :path_sep path-sep
  :join_paths join-paths

  :glob_path glob-path

  :get_filename get-filename

  :get_directory (fn [path]
    (if (= path-sep :/)
      (: path :sub 1 (+ (string.find path "/[^/]*$") 1))
      (: path :sub 1 (+ (string.find path "\\[^\\]*$") 1))))

  :load_modules (fn [req_path ignore]
  (local config-path (vim.fn.stdpath :config))
  (local lua-path (join-paths config-path :lua))
  (local full-path (join-paths lua-path req_path))
  (local paths (glob-path full-path :*.lua))
  (local modules {})
  (each [_ v (ipairs paths)]
    (when (or (= ignore nil)
              (not (: v :match (.. ignore "$"))))
      (local normalized (remove-suffix (remove-prefix v lua-path) :.lua))
      (local file-only (get-filename normalized))
      (tset modules file-only (require normalized))))
  modules) }

