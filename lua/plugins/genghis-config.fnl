{ 1 :chrisgrieser/nvim-genghis
  :opts {
	:fileOperations { :autoAddExt true }

	:navigation {
		:onlySameExtAsCurrentFile false
		:ignoreDotfiles true
		:ignoreExt [ :png :svg :webp :jpg :jpeg :gif :pdf :zip ]
		:ignoreFilesWithName [ :.DS_Store ]}

	:successNotifications true

	:icons 
    { ; set an icon to empty string to disable it
		:chmodx "󰒃"
		:copyFile "󱉥"
		:copyPath "󰅍"
		:duplicate ""
		:file "󰈔"
		:move "󰪹"
		:new "󰝒"
		:nextFile "󰖽"
		:prevFile "󰖿"
		:rename "󰑕"
		:trash "󰩹" }}
  :config (fn [lazy-opts]
			(local genghis (require :genghis))
			(genghis.setup lazy-opts.opts))
  :keys [{1 :<leader>ufn 2 "<CMD>Genghis copyFilename<CR>" :desc "Copies Filename" :mode "n"}
		 {1 :<leader>ufp 2 "<CMD>Genghis copyFilepath<CR>" :desc "Copies Filepath" :mode :n}
		 {1 :<leader>ufx 2 "<CMD>Genghis chmodx<CR>" :desc "chmod +x current file" :mode :n}
		 {1 :<leader>ufr 2 "<CMD>Genghis renameFile<CR>" :desc "Rename current file" :mode :n}]}
