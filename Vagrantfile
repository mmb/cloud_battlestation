Vagrant.configure('2') do |config|
  env = ENV.to_hash

  config.vm.box = 'dummy'

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = env.fetch('AWS_ACCESS_KEY_ID')
    aws.secret_access_key = env.fetch('AWS_SECRET_ACCESS_KEY')
    aws.keypair_name = env.fetch('AWS_KEYPAIR_NAME')
    aws.security_groups = env.fetch('AWS_VPC_SECURITY_GROUPS').split(',')
    aws.subnet_id = env.fetch('AWS_VPC_SUBNET')
    aws.associate_public_ip = true

    aws.instance_type = 't2.micro'
    # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
    aws.ami = 'ami-0070c468'

    aws.tags = { 'Name' => 'Cloud Battlestation' }

    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = env.fetch('SSH_PRIVATE_KEY_PATH')
  end

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = 'roles'
    chef.add_role 'cloud_battlestation'
  end

  config.vm.synced_folder 'synced/', '/home/ubuntu/synced'
end
