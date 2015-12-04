# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?('vagrant-vbguest')
  raise 'Please install the vagrant-vbguest plugin by running `vagrant plugin install vagrant-vbguest`'
end

VAGRANTFILE_API_VERSION = 2

ruby_version_file = File.join(File.dirname(__FILE__), '.ruby-version')
RUBY_VER = File.exist?(ruby_version_file) ? File.read(ruby_version_file) : '2.2.3'

 # We don't care about passwords, because it is a development VM
POSTGRES_PASS = ENV['GUIDERAPP_POSTGRES_PASS'] || 'password'
HOSTNAME = ENV['GUIDERAPP_HOSTNAME'] || 'guiderapp.com'
ADMIN_NAME = ENV['GUIDERAPP_ADMIN_NAME'] || 'admin'
ADMIN_EMAIL = ENV['GUIDERAPP_ADMIN_EMAIL'] || 'admin@admin.com'
ADMIN_PASSWORD = ENV['GUIDERAPP_ADMIN_PASSWORD'] || 'password'
SECRET_KEY_BASE = ENV['GUIDERAPP_SECRET_KEY_BASE'] || 'x' * 30

MEMORY = (ENV['GUIDERAPP_MEMORY'] || 2048).to_i
CPU_COUNT = (ENV['GUIDERAPP_CPU_COUNT'] || 2).to_i

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :private_network, ip: '192.168.33.10'
  config.vm.synced_folder '.', '/vagrant', nfs: true

  config.vm.provider :virtualbox do |vb|
    vb.name = 'guiderapp'
    vb.memory = MEMORY
    vb.cpus = CPU_COUNT
    vb.customize ['modifyvm', :id, '--cpuexecutioncap', '50']
  end

  config.vm.provision 'Update the packaqes list', type: 'shell' do |s|
    s.inline = 'sudo apt-get update > /dev/null 2>&1'
  end

  config.vm.provision 'Install the Postgress 9.3', type: 'shell', inline: <<-SHELL
    sudo apt-get install -y postgresql-9.3 postgresql-contrib-9.3 > /dev/null 2>&1
    sudo sed -r -i 's|peer|trust|g' /etc/postgresql/9.3/main/pg_hba.conf
    sudo service postgresql restart && sudo -u postgres -i
    psql -U postgres -d postgres -c "alter user postgres with password '#{POSTGRES_PASS}';"
    exit
    sudo sed -r -i 's|trust|md5|g' /etc/postgresql/9.3/main/pg_hba.conf
    sudo service postgresql restart
  SHELL

  config.vm.provision 'Install git, make, libssl, g++, build-essential libgmp3-dev libpq-dev', type: 'shell' do |s|
    s.inline = 'sudo apt-get install -y git make libssl-dev g++ build-essential libgmp3-dev libpq-dev imagemagick > /dev/null 2>&1'
  end

  config.vm.provision 'Install NodeJS', type: 'shell' do |s|
    s.inline = 'sudo apt-get install -y nodejs > /dev/null 2>&1'
  end

  config.vm.provision "Install RVM and Ruby #{RUBY_VER} and Bundler",
    type: 'shell', privileged: false, inline: <<-SHELL
      gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 > /dev/null 2>&1
      curl -sSL https://get.rvm.io | bash -s stable > /dev/null 2>&1
      source $HOME/.rvm/scripts/rvm

      rvm use --default --install #{RUBY_VER} > /dev/null 2>&1
      rvm cleanup all
  SHELL

  config.vm.provision 'Install project dependencies', type: 'shell', privileged: false, inline: <<-SHELL
    cd /vagrant/
    gem install bundler > /dev/null 2>&1
  SHELL
    #bundle install

  config.vm.provision 'Setup environment variables', type: 'shell', run: 'always', privileged: false, inline: <<-SHELL
    echo > $HOME/.profile
    echo -e 'export ADMIN_NAME=#{ADMIN_NAME}' >> $HOME/.profile
    echo -e 'export ADMIN_EMAIL=#{ADMIN_EMAIL}' >> $HOME/.profile
    echo -e 'export ADMIN_PASSWORD=#{ADMIN_PASSWORD}' >> $HOME/.profile
    echo -e 'export HOSTNAME=#{HOSTNAME}' >> $HOME/.profile
    echo -e 'export SECRET_KEY_BASE=#{SECRET_KEY_BASE}' >> $HOME/.profile

    echo -e 'alias rs="rails server -b 0.0.0.0"' >> $HOME/.profile

    source $HOME/.profile
  SHELL

#  config.vm.provision 'Connect to Postgress DB', type: 'shell', privileged: false, inline: <<-SHELL
#    cd /vagrant/
#    cp config/database.yml.example config/database.yml
#    sed -r -i 's|password:.*$|password: #{POSTGRES_PASS}|g' config/database.yml
#
#    rake db:setup
#  SHELL

#  config.vm.provision 'Prepare for testing', type: 'shell', privileged: false, inline: <<-SHELL
#    cd /vagrant/
#    RAILS_ENV=test bundle install > /dev/null 2>&1
#    rake db:test:prepare > /dev/null 2>&1
#  SHELL

  config.vm.provision 'PROVISIONING COMPLETE!', run: 'always', type: 'shell',
    privileged: false, inline: <<-SHELL
      echo -e '\nTo run the server:\n'
      echo -e 'vagrant ssh\n'
      echo -e 'cd /vagrant/\n'
      echo -e 'rails server -b 0.0.0.0\n'
  SHELL

  config.vbguest.auto_reboot = true
  config.vbguest.auto_update = true
end

