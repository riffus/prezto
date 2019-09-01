# Laravel basic command completion

_laravel_artisan () {
  echo "php $(find . -maxdepth 2 -mindepth 1 -name 'artisan' -type f | head -n 1)"
}

_laravel_get_command_list () {
  `_laravel_artisan` --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_laravel () {
  compadd `_laravel_get_command_list`
}

compdef _laravel '`_laravel_artisan`'
compdef _laravel 'artisan'

# #Alias
alias art='`_laravel_artisan`'
# alias sfcl='sf cache:clear'
# alias sfcw='sf cache:warmup'
# alias sfroute='sf router:debug'
# alias sfcontainer='sf container:debug'
# alias sfgb='sf generate:bundle'
