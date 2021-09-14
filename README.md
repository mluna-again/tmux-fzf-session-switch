# TMUX FZF Session Switch

## Purpose

If you're like me and you tend to have a lot of sessions to organize your
thoughts then this is the plugin for you. With this plugin you can search
through your sessions with fzf.

## Customization from Thuan Pham (that me)

- Work with session name have `space` character. e.g. "Thuan Pham is handsome"
- I use prefix in tmux is `ctrl + a`, So I mod default key to `ctrl + f` cuz when you press `ctrl + a + f` in one time, your right hand don't need have any motion, for me this faster than default `prefix + l`

## Functionality
- `Prefix + Ctrl + f`: Open up fzf in a new tab.
- If you type a name that doesn't exist, you will be prompted to create it.

## Requirements

[fzf](https://github.com/junegunn/fzf)
rg (recommended but not required)
