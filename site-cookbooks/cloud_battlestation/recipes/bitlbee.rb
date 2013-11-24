package 'bitlbee'

cookbook_file 'bitlbee.conf' do
  path '/etc/bitlbee/bitlbee.conf'
end

service 'bitlbee' do
  action :restart
end
