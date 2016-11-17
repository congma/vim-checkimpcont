## vim-checkimpcont ##

Vim plugin for [checkimpcont][cic], a tool that detects possibly misleading
string literal concatenations in Python-2.x sources


## Installation ##

1.  First, please install the Python script [checkimpcont.py][cic].
2.  After that, put the Vim plugin script in your `.vim/ftplugin/python`
    directory.
3.  Alternatively, you can also use [`pathogen`][pathogen] to install the
    plugin.


## Usage ##

In the `.vimrc` file, you can define the key mapping that invokes the check
function.  For instance, to map it to <kbd>F6</kbd>, use the following:

```viml
let g:checkimpcont_map = <F6>
```

The default value is <kbd>&lt;Leader&gt;</kbd><kbd>C</kbd>.


## License ##

Public domain.


[cic]: https://github.com/congma/checkimpcont "checkimpcont"
[pathogen]: https://github.com/tpope/vim-pathogen "pathogen: a Vim runtimepath manager"
