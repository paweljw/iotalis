require 'singleton'

class Influxdb
  extend Forwardable
  include Singleton

  delegate %i(write_point) => :@client

  def self.ensure_database(database)
    client = InfluxDB::Client.new(url: Settings.influxdb_url)
    client.create_database(database)
  end

  def initialize
    self.class.ensure_database(Settings.database)
    @client = InfluxDB::Client.new(url: Settings.influxdb_url, database: Settings.database)
  end
end
