package 'transmission-daemon'

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

node.set_unless[:transmission][:password] = secure_password

service 'transmission-daemon' do
  action :stop
end

template '/etc/transmission-daemon/settings.json' do
  source 'transmission-daemon-settings.erb'
  owner 'debian-transmission'
  group 'debian-transmission'
  mode '0600'
  variables({
    password: node[:transmission][:password]
  })
end

service 'transmission-daemon' do
  action :start
end

template '/home/ubuntu/.netrc' do
  source 'netrc.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0600'
  variables({
    password: node[:transmission][:password]
  })
end

git '/opt/transmission-remote-cli' do
  repository 'https://github.com/fagga/transmission-remote-cli.git'
  action :sync
end

link '/usr/local/bin/transmission-remote-cli' do
  to '/opt/transmission-remote-cli/transmission-remote-cli'
end
