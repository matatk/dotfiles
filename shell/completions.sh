command -v npm > /dev/null && source <(npm completion)

# adapted from that which was added automatically by the travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
