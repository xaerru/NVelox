local plugins = require "plugins"
local loader = require("loader").init()
loader:load { plugins, loader.user_plugins }
require("plug_config")
require("general")
require("colors")
