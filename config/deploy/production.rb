server "iot.steamshard.net", user: "iotalis", roles: %w{app db web}

 set :ssh_options, {
   forward_agent: true
 }
