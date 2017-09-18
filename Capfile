# Load DSL and set up stages
require "capistrano/setup"

require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/bundler"
require 'capose'
require 'capistrano/pumactl'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
