" vim: set ft=vim:

let config_path = stdpath('config')

exec 'source' config_path . "/init/plug.vim"
exec 'source' config_path . "/init/helpers.vim"
exec 'source' config_path . "/init/basic.vim"
exec 'source' config_path . "/init/plugins.vim"
exec 'source' config_path . "/init/filetypes.vim"


" Private configuration
if filereadable(config_path . "/private.vim")
  exec 'source' config_path . "/private.vim"
endif

