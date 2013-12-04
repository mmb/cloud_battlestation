package 'weechat-curses'

include_recipe 'python'

python_pip 'python-potr'

git '/opt/weechat-otr' do
  repository 'https://github.com/mmb/weechat-otr.git'
  action :sync
end

%w{
  /home/ubuntu/.weechat
  /home/ubuntu/.weechat/python
  /home/ubuntu/.weechat/python/autoload
}.each do |dir|
  directory dir do
    owner 'ubuntu'
    group 'ubuntu'
    action :create
  end
end

link '/home/ubuntu/.weechat/python/autoload/weechat_otr.py' do
  to '/opt/weechat-otr/weechat_otr.py'
end
