require_relative 'bootstrap'

class NotAuthorizedException < StandardError; end

class Iotalis < Webservice::Base
  post '/temperature' do
    authorize!
    Influxdb.instance.write_point(tagged('temperature'), values: { value: data })
    { status: 'OK' }
  end

  post '/humidity' do
    authorize!
    Influxdb.instance.write_point(tagged('humidity'), values: { value: data })
    { status: 'OK' }
  end

  private

  def access_token
    request.POST['token']
  end

  def tagged(series)
    return "#{series}-#{tag}" unless tag.size < 1
    series
  end

  def tag
    request.POST['tag']
  end

  def authorize!
    error(403) unless access_token == Settings.access_token
  end

  def data
    request.POST['data']
  end
end

run Iotalis
