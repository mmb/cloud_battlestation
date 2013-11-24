Create an instance on Amazon that hosts a persistent tmux session
running the WeeChat IRC client.

Use WeeChat for IRC and IM (using bitlbee). Also run a local IRC server
with personal bots for news and other custom functions (coming soon).

Installation:

```
gem install berkshelf
berks install

Install vagrant

vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
vagrant plugin install vagrant-aws
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

Set these environment variables:

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_KEYPAIR_NAME=

# The private key downloaded from Amazon when the key pair was created.
export SSH_PRIVATE_KEY_PATH=

# Use an AWS security group that has inbound port 22 open.
export AWS_SECURITY_GROUPS=

Put your DynDNS login, password and hostname in
roles/cloud_battlestation.rb to give the instance a permanent hostname.

vagrant up --provider=aws
```

Logging in:

```
ssh -i <path to your private key> ubuntu@your_dyndns_hostname
```
