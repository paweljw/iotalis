require 'rubygems'
require 'bundler'
Bundler.require(:default)

DATABASE = 'iotalis'.freeze

influxdb = InfluxDB::Client.new
influxdb.create_database(DATABASE)

influxdb = InfluxDB::Client.new(DATABASE)

Value = (0..360).to_a.map { |i| Math.send(:sin, i / 10.0) * 10 }.each

loop do
  data = {
    values: { value: Value.next },
    tags:   { wave: 'sine' } # tags are optional
  }

  influxdb.write_point('sine', data)
end
