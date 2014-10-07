Create a cloud battlestation on Amazon with:

* tmux
* WeeChat IRC client
* BitlBee for instant messaging
* Transmission BitTorrent daemon and curses client
* Tor

# Installation

Install Berkshelf according to the instructions at http://berkshelf.com/.

```
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

# The subnet id of a subnet in a VPC.
export AWS_VPC_SUBNET=

# The private key downloaded from Amazon when the key pair was created.
export SSH_PRIVATE_KEY_PATH=

# Comma-separated list of AWS security group ids. These must exist in the
# same VPC as AWS_VPC_SUBNET. Port 22 must be open.
export AWS_VPC_SECURITY_GROUPS=

vagrant up --provider=aws
vagrant ssh
```

# Amazon security group configuration

Allow inbound ports:

* 22 (ssh)
* 51413 (BitTorrent, optional)
* 9091 (Transmission web interface, optional)
