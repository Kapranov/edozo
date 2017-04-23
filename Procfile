web0: bundle exec rails server thin -p $PORT -e $RACK_ENV
web1: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
web2: subcontract --rbenv . --chdir ../edozo --signal INT -- bundle exec rackup config.ru -p $PORT &
web3: bundle exec sidekiq
