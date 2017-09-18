workers 2

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/tmp"

# Default to production
iotalis_env = ENV['IOTALIS_ENV'] || "development"
environment iotalis_env

if iotalis_env == 'production'
  bind "unix://#{shared_dir}/sockets/puma.sock"
  daemonize
else
  bind 'tcp://0.0.0.0:9292'
end

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

preload_app!
