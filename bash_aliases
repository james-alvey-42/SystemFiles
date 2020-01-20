#alias ipython='ipython3'
#alias python='python3'
#alias pyinstall='sudo pip3 install'
alias ls='ls -l'
alias ls.='ls -l && ls -d .*'
alias jp='jupyter notebook'
alias ..='cd ..'
alias bashprofile='vim ~/.bash_profile'
alias aliasconfirm='source ~/.bash_profile'
alias mplstyle='edit /Users/james/.matplotlib/stylelib/ja.mplstyle'
alias pi_one_ssh='ssh pi@192.168.1.100'
alias ls='ls -l'
alias cosmos='expect ~/scripts/cosmos.sh'
alias files='vim ~'
alias vimrc='vim ~/.vimrc'
alias jptf='source activate tf; jp'
alias endtf='source deactivate tf'
alias revision='cd /Users/james/allMyStuff/Revision\ Notes/; pdflatex revision_notes.tex; open revision_notes.pdf;'
alias c='clear'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias search='grep -r -n -i -a'
alias v='vim'
alias mystuff='cd ~/allMyStuff'
alias chep='./calchep'
alias chepdir='mkWORKdir'
alias edit='kak'
alias kings-login='expect ~/scripts/kings.sh'
alias miguel='expect ~/scripts/miguel.sh'
alias ipython-startup='cd ~/.ipython/profile_default/startup/'
alias mg5='python2 ~/Programs/MG5_aMC_v2_6_4/bin/mg5_aMC'
alias arxiv='sh ~/scripts/arxiv.sh'
alias newmplstyle='cp ~/allMyStuff/PythonHelp/ja.mplstyle /Users/james/.matplotlib/stylelib/ja.mplstyle'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias edit='subl'
alias pytest='python -m unittest'
alias cpdocs='cp -a _build/html/. ../docs/'

newLatexPres () {
  mkdir $1_dir
  cd $1_dir
  cp ~/allMyStuff/LatexHelp/presentation.tex .
  mv presentation.tex $1.tex
  atom $1.tex
}

newLatexDoc () {
  mkdir $1_dir
  cd $1_dir
  cp ~/allMyStuff/LatexHelp/article.tex .
  if [ -f "articlepackage.tex" ]
  then
    echo "Package manager already exists"
  else
    cp ~/allMyStuff/LatexHelp/articlepackage.tex .
  fi
  mv article.tex $1.tex
  cp ~/allMyStuff/LatexHelp/sectsty.sty .
  atom $1.tex
}

newJcapDoc () {
  mkdir $1_dir_jcap
  cd $1_dir_jcap
  cp ~/allMyStuff/LatexHelp/article.tex .
  if [ -f "articlepackage.tex" ]
  then
    echo "Package manager already exists"
  else
    cp ~/allMyStuff/LatexHelp/articlepackage.tex .
  fi
  if [ -f "jcappub.sty" ]
  then
    echo "Already have jcap style file"
  else
    cp ~/allMyStuff/LatexHelp/jcappub.sty .
  fi
  mv article.tex $1.tex
  atom $1.tex
}

make_docs ()
{
  make html
  cp _build/html/* ../docs/
  cp _build/html/_sources/* ../docs/_sources/
  cp _build/html/_static/* ../docs/_static/
}

compile () {
  pdflatex $1.tex
  pdflatex $1.tex
  open $1.pdf
}

compilebib () {
  pdflatex $1.tex
  if [ $> -ne 0 ]; then
    echo "Compilation error. Check log."
    exit 1
  fi
  bibtex $1
  pdflatex $1.tex
  pdflatex $1.tex
  open $1.pdf
}
