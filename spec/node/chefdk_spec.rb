require 'spec_helper'

describe package('vim-enhanced') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe package('docker-io') do
  it { should be_installed }
end

describe service('docker') do
#  it { should be_enabled }
  it { should be_running }
end

describe package('chefdk') do
  it { should be_installed.with_version('0.2.1') }
end

describe file('/home/vagrant/.bashrc') do
  its(:content) { should match /eval \"\$\(chef shell-init bash\)\"/ }
end

