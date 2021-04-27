let g:dashboard_default_executive = 'fzf'

let g:dashboard_custom_header = [
\ ' ██████╗ ██████╗ ██╗   ██╗██╗  ██╗███████╗',
\ '██╔════╝ ██╔══██╗██║   ██║╚██╗██╔╝██╔════╝',
\ '██║  ███╗██████╔╝██║   ██║ ╚███╔╝ ███████╗',
\ '██║   ██║██╔══██╗╚██╗ ██╔╝ ██╔██╗ ╚════██║',
\ '╚██████╔╝██║  ██║ ╚████╔╝ ██╔╝ ██╗███████║',
\ ' ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚══════╝',
\]

let g:dashboard_custom_footer = ['']

let g:dashboard_custom_section = {
\    'a' : {'description' : ['           Find File          '], 'command': ':FZF'},
\    'b' : {'description' : ['           Find Word          '], 'command' : ':Rg'},
\    'c' : {'description' : ['           Config             '], 'command' : ':e ~/.config/nvim/init.vim'}
\}

