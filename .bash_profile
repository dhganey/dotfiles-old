export PATH=~/bin:/usr/local/bin:~/code/scripts:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export MAVEN_OPTS="-Xmx2G -Xms1G -XX:ReservedCodeCacheSize=128m -XX:-MaxFDLimit"
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
source ~/code/scripts/completions/eg.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# for 'too many open files' issue
ulimit -n 16000
eval "$(~/code/fin/bin/fin init -)"
eval "alias cls=clear"
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export REDFIN_MAIN=$HOME/code/main
