
{ :has_plugin 
 (fn [plugin_path]
  (var success true)
  (fn err []
    (set success false))
  (xpcall (fn [] (local _ (require plugin_path)))
          err)
  success) }
