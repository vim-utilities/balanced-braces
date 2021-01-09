# Balanced Braces
[heading__top]:
  #balanced-braces
  "&#x2B06; Balance parentheses, curly-braces, and square-brackets"


Balance parentheses, curly-braces, and square-brackets


## [![Byte size of Balanced Braces][badge__main__balanced_braces__source_code]][balanced_braces__main__source_code] [![Open Issues][badge__issues__balanced_braces]][issues__balanced_braces] [![Open Pull Requests][badge__pull_requests__balanced_braces]][pull_requests__balanced_braces] [![Latest commits][badge__commits__balanced_braces__main]][commits__balanced_braces__main]


---


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

  - [:floppy_disk: Clone][heading__clone]
  - [:heavy_plus_sign: Install][heading__install]
  - [:fire: Uninstall][heading__uninstall]
  - [:arrow_up: Upgrade][heading__upgrade]
  - [:bookmark_tabs: Documentation][heading__documentation]

- [&#x1F9F0; Usage][heading__usage]

- [:symbols: Configuration][heading__configuration]

- [&#x1F5D2; Notes][heading__notes]

- [:chart_with_upwards_trend: Contributing][heading__contributing]

  - [:trident: Forking][heading__forking]
  - [:currency_exchange: Sponsor][heading__sponsor]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


---



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


This repository requires the [Vim][vim_home] text editor to be installed the source code is available on [GitHub -- `vim/vim`][vim__github], and most GNU Linux package managers are able to install Vim directly, eg...


- Arch based Operating Systems


```Bash
sudo packman -Syy

sudo packman -S vim
```


- Debian derived Distributions


```Bash
sudo apt-get update

sudo apt-get install vim
```


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


> Perhaps as easy as one, 2.0,...


---


### Clone
[heading__clone]:
  #clone
  "&#x1f4be;"


Clone this project...


```Bash
mkdir -vp ~/git/hub/vim-utilities

cd ~/git/hub/vim-utilities

git clone git@github.com:vim-utilities/balanced-braces.git
```


---


### Install
[heading__install]:
  #install
  "&#x2795;"


If **not** using a plugin manager, then this plugin may be installed via `make install` command...


```Bash
cd ~/git/hub/vim-utilities/balanced-braces

make install
```


---


### Uninstall
[heading__uninstall]:
  #uninstall
  "&#x1f525;"


If not using a plugin manager, then this plugin may be uninstalled via `uninstall` Make target...


```Bash
cd ~/git/hub/vim-utilities/balanced-braces

make uninstall
```


... Which will remove symbolic links and update the Vim help tags file.


---


### Upgrade
[heading__upgrade]:
  #upgrade
  "&#x2b06;"


To update in the future use `make upgrade` command...


```Bash
cd ~/git/hub/vim-utilities/balanced-braces

make upgrade
```


---


### Documentation
[heading__documentation]:
  #documentation
  "&#x1F4D1;"


After installation, plugin documentation may be accessed via Vim's `:help` command, eg...


```Vim
:help balanced-braces.txt
```


______


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"


While in Insert mode open/close curly-braces, parentheses, and square-brackets will have the following behavior:


- `{` Open curly-brace; automatically insert a closing curly-brace, and move the cursor left by one column

- `}` Close curly-brace; optionally move the cursor right by one column, if currently on a closing curly-brace, or insert closing curly-brace


- `(` Open parenthesis; automatically insert a closing parenthesis, and move the cursor left by one column

- `)` Close parenthesis; optionally move the cursor right by one column, if currently on a closing parenthesis, or insert closing parenthesis


- `[` Open square-bracket; automatically insert a closing square-bracket, and move the cursor left by one column

- `]` Close square-bracket; optionally move the cursor right by one column, if currently on a closing square-bracket, or insert closing square-bracket


______


## Configuration
[heading__configuration]:
  #configuration
  "&#x1F523; How to configure plugin behavior/features"


Existing defaults may be modified or extended by assigning `g:balanced_braces` variable within the `~/.vimrc` file for a given account. Example of defaults...


```Vim
let g:balanced_braces = {
      \   'parentheses': { 'open': '(', 'close': ')' },
      \   'curly-brace': { 'open': '{', 'close': '}' },
      \   'square-bracket': { 'open': '[', 'close': ']' },
      \ }
```


Example of adding angle-bracket support...


```Vim
let g:balanced_braces = {
      \   'angle-bracket': { 'open': '<', 'close': '>' },
      \ }
```


---


Alternatively one may instead assign a JSON file path to the `g:balanced_braces` variable to customize configurations, eg...


```JSON
{
  "parentheses": {
    "open": "(",
    "close": ")"
  },
  "curly-brace": {
    "open": "{",
    "close": "}"
  },
  "square-bracket": {
    "open": "[",
    "close": "]"
  }
}
```


Configuration via JSON file path example...


```Vim
let g:balanced_braces = '~/.vim/configs/balanced-braces.json'
```


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to balanced-braces and vim-utilities"


Options for contributing to balanced-braces and vim-utilities


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking balanced-braces"


Start making a [Fork][balanced_braces__fork_it] of this repository to an account that you have write permissions for.


- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/vim-utilities/balanced-braces

git remote add fork git@github.com:<NAME>/balanced-braces.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/vim-utilities/balanced-braces


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push -u fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/vim-utilities/.github) repository for detailed contributing guidelines.


---


### Sponsor
  [heading__sponsor]:
  #sponsor
  "&#x1F4B1; Methods for financially supporting vim-utilities that maintains balanced-braces"


Thanks for even considering it!


Via Liberapay you may <sub>[![sponsor__shields_io__liberapay]][sponsor__link__liberapay]</sub> on a repeating basis.


Regardless of if you're able to financially support projects such as balanced-braces that vim-utilities maintains, please consider sharing projects that are useful with others, because one of the goals of maintaining Open Source repositories is to provide value to the community.


______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [Vi -- StackExchange -- How can I merge two dictionaries in Vim?](https://vi.stackexchange.com/questions/20842/)

- [Vim -- Redit -- How do I make Vim automatically complete parentheses and quotes for me?](https://www.reddit.com/r/vim/comments/bsh7da/)

- [StackOverflow -- how to make a vimscript function with optional arguments](https://vi.stackexchange.com/questions/2410/)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Balance parentheses, curly-braces, and square-brackets
Copyright (C) 2021 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__balanced_braces__main]:
  https://img.shields.io/github/last-commit/vim-utilities/balanced-braces/main.svg

[commits__balanced_braces__main]:
  https://github.com/vim-utilities/balanced-braces/commits/main
  "&#x1F4DD; History of changes on this branch"


[balanced_braces__community]:
  https://github.com/vim-utilities/balanced-braces/community
  "&#x1F331; Dedicated to functioning code"


[issues__balanced_braces]:
  https://github.com/vim-utilities/balanced-braces/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[balanced_braces__fork_it]:
  https://github.com/vim-utilities/balanced-braces/fork
  "&#x1F531; Fork it!"

[pull_requests__balanced_braces]:
  https://github.com/vim-utilities/balanced-braces/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[balanced_braces__main__source_code]:
  https://github.com/vim-utilities/balanced-braces/
  "&#x2328; Project source!"

[badge__issues__balanced_braces]:
  https://img.shields.io/github/issues/vim-utilities/balanced-braces.svg

[badge__pull_requests__balanced_braces]:
  https://img.shields.io/github/issues-pr/vim-utilities/balanced-braces.svg

[badge__main__balanced_braces__source_code]:
  https://img.shields.io/github/repo-size/vim-utilities/balanced-braces


[vim__home]:
  https://www.vim.org
  "Home page for the Vim text editor"

[vim__github]:
  https://github.com/vim/vim
  "Source code for Vim on GitHub"


[sponsor__shields_io__liberapay]:
  https://img.shields.io/static/v1?logo=liberapay&label=Sponsor&message=vim-utilities

[sponsor__link__liberapay]:
  https://liberapay.com/vim-utilities
  "&#x1F4B1; Sponsor developments and projects that vim-utilities maintains via Liberapay"

