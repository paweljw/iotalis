require_relative 'bootstrap'

class NotAuthorizedException < StandardError; end

class Iotalis < Webservice::Base
  post '/temperature' do
    authorize!
    Influxdb.instance.write_point('temperature', values: { value: data })
    { status: 'OK' }
  end

  post '/humidity' do
    authorize!
    Influxdb.instance.write_point('humidity', values: { value: data })
    { status: 'OK' }
  end

  def access_token
    request.POST['token']
  end

  def authorize!
    error(403) unless access_token == Settings.access_token
  end

  def data
    request.POST['data']
  end
end

run Iotalis
