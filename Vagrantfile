Vagrant.configure('2') do |config|
  env = ENV.to_hash

  config.vm.box = 'dummy'

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = env.fetch('AWS_ACCESS_KEY_ID')
    aws.secret_access_key = env.fetch('AWS_SECRET_ACCESS_KEY')
    aws.keypair_name = env.fetch('AWS_KEYPAIR_NAME')
    aws.security_groups = env.fetch('AWS_SECURITY_GROUPS').split(',')

    aws.instance_type = 't1.micro'
    aws.ami = 'ami-a73264ce'

    aws.tags = { 'Name' => 'Cloud Battlestation' }

    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = env.fetch('SSH_PRIVATE_KEY_PATH')
  end

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = 'roles'
    chef.add_role 'cloud_battlestation'
  end

end
