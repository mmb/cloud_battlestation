cookbook_file 'motd' do
  path '/etc/motd'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  force_unlink true
end
