{ :ifilter
  (fn [t filter-iter]
   (local out {})
   (each [k v (ipairs t)]
     (when (filter-iter v k t)
         (table.insert out v))
   out))

  :kfilter 
  (fn [t filter-iter]
    (local out {})
   (each [k v (pairs t)]
     (when (filter-iter v k t)
         (table.insert out v))
   out))

; Shamelessly adapted from https://www.reddit.com/r/learnprogramming/comments/s41ykx/lua_is_there_a_method_to_see_if_a_table_or_array/
  :contains
  (fn [arr value ?test]
    (local test (if (= ?test nil) (fn [lhs rhs] (= lhs rhs)) ?test))
    (var result false)
    (for [i 1 (# arr)]
      (when (test (. arr i) value)
        (set result true)))
    result)

; Stolen from https://www.reddit.com/r/neovim/comments/su0em7/pathjoin_for_lua_or_vimscript_do_we_have_anything/
  :split
  (fn [inputString sep]
    (local fields {})
    (local pattern (string.format "([^%s]+)" sep))
    (string.gsub inputString pattern
                 (fn [c] (tset fields (+ (# fields) 1) c)))
    fields)}

