cookbook_file 'tmux.conf' do
  path '/home/ubuntu/.tmux.conf'
  owner 'ubuntu'
  group 'ubuntu'
  action :create_if_missing
end
