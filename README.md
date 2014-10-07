Create a cloud battlestation on Amazon with:

* tmux
* WeeChat IRC client
* BitlBee for instant messaging
* Transmission BitTorrent daemon and curses client
* Tor

# Installation

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

# The AWS security group to use (open port 22 required).
export AWS_SECURITY_GROUPS=

vagrant up --provider=aws
```

# Amazon security group configuration

Allow inbound ports:

* 22 (ssh)
* 51413 (BitTorrent, optional)
* 9091 (Transmission web interface, optional)

# Logging in

```
vagrant ssh
```
