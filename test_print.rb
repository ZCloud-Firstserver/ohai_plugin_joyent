#!/opt/local/bin/ruby

## test output

require 'ohai'

ohai = Ohai::System.new
Ohai::Config[:plugin_path] << File.expand_path("../plugins" , __FILE__) 

puts ohai.require_plugin "joyent_smartmachine"

require 'pp'
pp(ohai.data)
