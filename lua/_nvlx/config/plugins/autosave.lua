require("autosave").setup(
    require("_nvlx.utils").merge({ execution_message = "" }, nvlx.config.plugins.autosave, nvlx.config.plugins_override.autosave)
)
