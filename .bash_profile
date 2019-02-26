if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
. ~/.bash_aliases

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
source '/Users/pcx/base/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/pcx/base/google-cloud-sdk/completion.bash.inc'

export PATH="$HOME/.cargo/bin:$PATH"
