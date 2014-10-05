require 'serverspec'
require 'pathname'
require 'net/ssh'

set :backend, :ssh

host = ENV['VMNAME']

options  = Net::SSH::Config.for(host)
config   = `vagrant ssh-config #{host}`

realhost = ''

config.each_line do |line|
  if match = /HostName (.*)/.match(line)
    realhost = match[1]
  elsif  match = /User (.*)/.match(line)
    options[:user] = match[1]
  elsif match = /IdentityFile (.*)/.match(line)
    options[:keys] =  [match[1].gsub(/"/, '')]
  elsif match = /Port (.*)/.match(line)
    options[:port] = match[1]
  end
end

set :host, realhost
set :ssh_options, options
