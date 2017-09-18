IOTALIS_ROOT = File.expand_path(File.dirname(__FILE__))
IOTALIS_ENV = ENV['IOTALIS_ENV'] || 'development'

require 'rubygems'
require 'bundler'
Bundler.require(:default, IOTALIS_ENV)

Config.load_and_set_settings(
  Config.setting_files(File.join(IOTALIS_ROOT, 'config'), IOTALIS_ENV)
)

require_relative 'lib/influxdb'
