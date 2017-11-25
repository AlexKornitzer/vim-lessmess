     ██╗     ███████╗███████╗███████╗███╗   ███╗███████╗███████╗███████╗
     ██║     ██╔════╝██╔════╝██╔════╝████╗ ████║██╔════╝██╔════╝██╔════╝
     ██║     █████╗  ███████╗███████╗██╔████╔██║█████╗  ███████╗███████╗
     ██║     ██╔══╝  ╚════██║╚════██║██║╚██╔╝██║██╔══╝  ╚════██║╚════██║
     ███████╗███████╗███████║███████║██║ ╚═╝ ██║███████╗███████║███████║
     ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

# Lessmess: ViM even better whitespaces Plugin

[![Build Status](https://travis-ci.org/mboughaba/vim-lessmess.svg?branch=master)](https://travis-ci.org/mboughaba/vim-lessmess)


## Features
This plugin is capable of doing the following things for you:
* Remove trailing white-spaces at the end of a line;
* Fix mixed-indent, in other words, replace all sequences of 'Tab' character with new string of white-space;
* Remove empty lines at the end of the file;

By default the plugin does all of the above when you save a file, but this can be disabled to be able to execute clean-up on demand only.


## Instalation
1. (natively) Using ViM 8 packages

First, create a directory structure representing a plugin-group, say `whitespace`, as follows:

```shell
mkdir -p ~/.vim/pack/whitespace/start/
```
Next, clone (or alternatively, download the zip, and unzip) the plugins you want to install inside the start directory:

```shell
cd ~/.vim/pack/whitespace/start/
git clone https://github.com/mboughaba/vim-lessmess.git
git clone https://github.com/mboughaba/vim-lessmess.git
```


2. Using [Vundle](https://github.com/VundleVim/Vundle.vim)

First, declare the plugin in you `.vimrc`
```vim
Plugin 'mboughaba/vim-lessmess'
```
Then run plugin install command
```vim
:PluginInstall
```


3. Using [Plug](https://github.com/junegunn/vim-plug)

First, declare the plug in you `.vimrc`
```vim
Plug 'mboughaba/vim-lessmess'
```
Then run plug install command
```vim
:PlugInstall
```


## Motivation
Every ViM user has a custom configuration to remove trailing white-spaces, mine was `autocmd BufWritePre * :%s/\s\+$//e`
Such a trivial task isn't it? Well the idea here is all about moving that custom logic to its own plugin without having an impact on performance.

Keeping it stupid simple. I had the code around in my ![.vimrc](https://github.com/mboughaba/dotfiles/blob/master/.vimrc) and I decided to make a plugin out of it.
This is fully tested and blazing fast but if you don't mind white-spaces in your files :alien: this is the best time to navigate away :rocket:


## Usage
Out of the box, this plugin will clean trailing white-space, fix mixed-indent and remove empty lines at the end of a file when the file is saved.
In more technical details, there are two important functions `LessmessExecute` and `LessmessDisplayToggle`.

### Automagically remove all annoying white-spaces :heavy_check_mark:
White-spaces removal `onsave` is enabled by default. Just save the buffer and the file is clean.

### Manually remove all annoying white-spaces
First, to disable lessmess `onsave` make sure to include the configuration below in your `.vimrc`
```vim
let g:enable_lessmess_onsave = 0
```
To remove (on demand) trailing white-spaces, fix mixed-indent and remove newlines at the end of file all at once, call the following command:
```vim
LessmessExecute
```

### Simple white-spaces highlighting
I personally don't see a need of white-space highlighting, if I know they will be removed when I save. Nevertheless, to toggle highlighting of hidden characters, use command below.
```vim
LessmessDisplayToggle
```
This is simply calling vim native toggle list, I highly believe that syntax highlighting for white-spaces is a bit overkill. So why not just use ViM built-in list.

### Configuration
1. To Enable/disable Lessmess
```vim
LessmessToggle
```

2. Plugin can be disabled per buffer. An example would disabling white-spaces trimming for all `vader` test files
```vim
"
" Lessmess disable by FileType
"
aug disable_lessmess
    au!
    au FileType vader let b:lessmess_disable_buffer = 1
aug end
```

3. To completely disable the plugin, setting below can be added to `.vimrc`
 ```vim
let g:disable_lessmess = 1
 ```

### Handy tool
When **Lessmess is disabled**, white-spaces can be removed by calling `force` execute:
```vim
LessmessForceExecute
```

### Checking plugin status
To check status of the plugin one should call
```vim
LessmessStatus
```

## Running tests
check the setup in the test folder.
```shell
test/vader/run
```


## Self promotion
Why this one and not the other two or three trailing white-spaces removal plugins?
1. This is fully `autoloaded`, slowing down your ViM startup time was not an option
2. This is designed with performance in mind. The plugin doesn't do live updates, it does the heavy lifting when ViM is idle.
    1. Making use of Vim jobs is in the pipe.
3. Absolutely no configuration is required to get started. Everything follows the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle)
4. This plugin is fully unit tested using [Vader](https://github.com/junegunn/vader.vim)
5. This running on [Travis CI](https://travis-ci.org/mboughaba/vim-lessmess)
6. This is actively maintained
