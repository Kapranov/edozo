V ?= @
LOCALHOST := '127.0.0.1'
PORT := '3000'
VERSION := '0.0.1'
LOCALSERVER := 'http://api.dev.local:3000'
RUBYSERVICE := $(shell pgrep ruby)
NGINXSERVICE := $(shell pgrep nginx)
UNICORNSERVICE := $(shell pgrep unicorn)
DEVELOPMENT := 'development'
PRODUCTION := 'production'
TEST := 'test'
export CUCUMBER_COLORS=pending_param=magenta:failed_param=magenta:passed_param=magenta:skipped_param=magenta

default:
	$(V)echo Please use \'make help\' or \'make ..any_parameters..\'

help:
	$(V)clear
	$(V)echo "\n\n\t Manual Makefile to start of the project:\n\n make start - Start App Development Environment.\n make test  - Start App Test Environment.\n"

down:
	$(V)if [ "$(RUBYSERVICE)" ]; then killall ruby && echo "Running Ruby Service Killed"; else echo "No Running Ruby Service!"; fi
	$(V)if [ "$(NGINXSERVICE)" ]; then service nginx stop && echo "Running Nginx Service Killed"; else echo "No Running Nginx Service!"; fi

ruby_drop:
	$(V)echo "\nChecking to see if RUBY process exists:\n"
	$(V)if [ "$(RUBYSERVICE)" ]; then killall ruby && echo "Running Ruby Service Killed"; else echo "No Running Ruby Service!"; fi

processes:
	$(V)ps aux | grep 'ruby' | awk '{print $2}' | xargs kill -9

nginx: ruby_drop
	$(V)if [ "$(RUBYSERVICE)" ]; then killall ruby && echo "Running Ruby Service Killed"; else echo "No Running Ruby Service!"; fi
	$(V)if [ "$(NGINXSERVICE)" ]; then service nginx stop && echo "Running Nginx Service Killed"; else echo "No Running Nginx Service!"; fi
	$(V)if [ "$(UNICORNSERVICE)" ]; then ps aux | grep 'unicorn' | awk '{print $2}' | xargs kill -9 && echo "Running Unicorn Service Killed"; else echo "No Running Unicorn Service!"; fi

bundle:
	$(V)rm -f Gemfile.lock
	$(V)bundle

clean: bundle
	$(V)clear
	$(V)rake tmp:clear
	$(V)rake log:clear

seed:
	$(V)rake db:seed

reload:
	$(V)rake db:reload

rake:
	$(V)rake cache_shrine:clean_store
	$(V)rake cache_shrine:clean_cache
	$(V)rake db:drop
	$(V)rake db:create
	$(V)rake db:migrate
	$(V)rake db:seed
	$(V)rake counter_cache:task_counter
	$(V)rake tmp:clear
	$(V)rake log:clear

brakeman:
	$(V)brakeman -d

server:
	$(V)ruby -run -e httpd . -p 3000

test: clean
	$(V)rake test

start: down nginx clean brakeman
	$(V)echo "\n\n\t  Start App $(DEVELOPMENT) Enviroment\n\n\t     $(LOCALSERVER)\n\n"
	$(V)bundle exec rackup config.ru -p 3000
