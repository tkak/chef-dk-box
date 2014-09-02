require 'serverspec'
require 'pathname'
require 'net/ssh'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS

host = ENV['VMNAME']

options  = Net::SSH::Config.for(host)
config   = `vagrant ssh-config #{host}`

realhost = ""
user     = ""

config.each_line do |line|
  if match = /HostName (.*)/.match(line)
    realhost = match[1]
  elsif  match = /User (.*)/.match(line)
    user = match[1]
  elsif match = /IdentityFile (.*)/.match(line)
    options[:keys] =  [match[1].gsub(/"/,'')]
  elsif match = /Port (.*)/.match(line)
    options[:port] = match[1]
  end
end

SpecInfra.configuration.ssh = Net::SSH.start(realhost, user, options)

property[:os] = backend.check_os
