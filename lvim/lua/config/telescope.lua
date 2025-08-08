lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "neoclip")
	pcall(telescope.load_extension, "frecency")
	pcall(telescope.load_extension, "media_files")
end
