; Must be a <cmd> / <cr> thing to be dot-repeatable
(fn makeCmd [str]
  (.. :<cmd> str :<cr>))

(fn make-var-txt-obj [obj arg1 arg2]
  (var args "")
  (if (~= arg2 nil)
    (set args (.. "(\"" arg1 "\", \"" arg2 "\")"))
    (set args (.. "(\"" arg1 "\")")))
  (makeCmd (.. "lua require('various-textobjs')." obj args)))

(fn make-text-obj-keybind [key obj arg1 arg2 ?desc]
  (var desc ?desc)
  (if (= desc nil)
    (if (and (~= arg1 nil) (~= arg2 nil))
        (set desc (.. "select " obj))
        (= arg2 nil)
        (set desc (.. "select " obj " " arg1))
        (~= arg2 nil)
        (set desc (.. "select " obj " " arg1 "/" arg2))))
  { 1 key
    2 (make-var-txt-obj obj arg1 arg2)
    :mode [ :x :o ]
    :desc desc})

{ 1 :chrisgrieser/nvim-various-textobjs
  :event :VeryLazy
  :opts {:keymaps {:useDefaults false}}
  :keys [
    ; makeTextObjKeybind('ii', 'indentation', 'inner', 'inner'),
    ; when on unindented line, `ii` should select entire buffer
    { 1 :ii
      2 (fn []
          (if (= (_G.vim.fn.indent ".") 0)
              ((. (require :various-textobjs) :entireBuffer))
              ((. (require :various-textobjs) :indentation) :inner :inner)))
      :mode [ :o :x ]
      :desc "select indentation inner/inner" }
    (make-text-obj-keybind :ai :indentation :outer :inner)
    (make-text-obj-keybind :ia :indentation :inner :outer)
    (make-text-obj-keybind :aa :indentation :outer :outer)
    (make-text-obj-keybind :is :subword :inner)
    (make-text-obj-keybind :as :subword :outer)
    (make-text-obj-keybind :iq :anyQuote :inner)
    (make-text-obj-keybind :aq :anyQuote :outer)
    (make-text-obj-keybind :i_ :lineCharacterwise :inner)
    (make-text-obj-keybind :a_ :lineCharacterwise :outer)
    (make-text-obj-keybind :ib :anyBracket :inner)
    (make-text-obj-keybind :ab :anyBracket :outer)]}
