This is the companion repo from this post.  This repo relies on the famous [jaffle_shop](https://github.com/dbt-labs/jaffle_shop) tutorial to illustrate how to send dbt commands from vim.

It includes a basic .vimrc that will allow you to send dbt commands from vim. 
The default mappings are the following 

```
nnoremap ,dr :call ExecuteDbtCommand("run")<CR>
nnoremap ,dt :call ExecuteDbtCommand("test")<CR>
nnoremap ,dc :call ExecuteDbtCommand("compile")<CR>
nnoremap ,do :call OpenDbtCompile()<CR>
nnoremap ,drp :call ExecuteDbtCommand("run --target prod")<CR>
nnoremap ,dtp :call ExecuteDbtCommand("test --target prod")<CR>
nnoremap ,dcp :call ExecuteDbtCommand("compile --target prod")<CR>
```

## Prerequisites

- tmux
- vim-plug
- dbt

## Installation

use `.vimrc` as your config file and edit it with vim

    vim -u .vimrc .vimrc

Install the required plugins by executing (in normal mode)
    
    :PlugInstall

Configure your dbt profile in `~/.dbt/profiles.yml`

Create the required models

    dbt run

Fire a tmux session and start experimenting with the mappings!

    tmux new -s <session_name>
    vim -u .vimrc models/orders.sql

**NB:** you don't need to specify the vim config with `-u` file if you move `src/.vimrc` to your home directory

### Current limitations

At this stage, the dbt mappings require the terminal to be at the root of dbt repo. 
If not, the parsing of the buffer path won't be correct and the dbt commands will fail.
