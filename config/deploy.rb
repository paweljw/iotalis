# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "iotalis"
set :repo_url, "git@github.com:paweljw/iotalis.git"

set :deploy_to, "/app"

append :linked_dirs, "tmp", "log", "config/settings"

append :bundle_bins, 'pumactl'

after :'deploy:publishing', :'pumactl:restart'
