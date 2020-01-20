# SystemFiles

Useful template for various system files and where to store them, this includes:

* **Bash** - bash aliases, profile, and rc files
* **iPython** - an iPython startup file to automatically import libraries
* **Matplotlib Style** - a default stylesheet for matplotlib
* **Latex** - a default article and presentation class
* **zsh** - a zshrc file
* **Python** - an up to date python requirements file (can be used via e.g. `pip install > py_requirements.txt`

Setup
=====

Setting up a new machine can be frustrating, but the following should work for Ubuntu 18.04:

Command Line
---

First install the ZSH command line with the following sequence of commands;

1. `sudo apt install git-core zsh`
2. `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
3. `sudo apt install fonts-powerline`

Then amend the various system files such as;

1. Change the theme in the `.zshrc` file to `agnoster`
2. Source the `.bash_aliases` file in `.zshrc`
3. Add `chsh -s /usr/bin/zsh` to the `.bashrc` file

Python
---

The best place to install Python is to download it from the Anaconda distribution. To do so;

1. Download the latest version from [here](https://www.anaconda.com/distribution/)
2. Run the installer within the terminal using `bash [installer].sh`
3. Answer yes to the question whether you want to run `conda init`
4. Copy the text added to the end of the `.bashrc` file into your `.zshrc` file
5. Run `conda config --set changeps1 False` in the terminal
6. For Matplotlib to function properly need to have firstly installed LaTeX as described below and also;
  - Create a folder `~/.matplotlib/stylelib/` and add `ja.mplstyle` to it
  - Add the line `style.use('~/.matplotlib/stylelib/ja.mplstyle')` to the end of `~/anaconda3/lib/python3.x/site-packages/matplotlib/pyplot.py`
  - Run `sudo apt-get install dvipng` in the terminal

LaTeX
-----

To install LaTeX, just run `sudo apt install texlive-latex-extra` in the terminal.
