
set :rails_env, 'live'

server 'pim.psg-holding.eu:222', :app, :web, :primary => true

set :scm, :git
set :deploy_to, '/deployment'
set :deploy_via, :remote_cache

set :stage_domain,  'pim.psg-holding.eu:222'
set :stage_branch,  'master'

# capistrano doesnt suppert to deploy to the same machine.
role :app, 'pim.psg-holding.eu:222', :master => true

set :use_sudo, false
set :user, '3oZuX0wq'
set :ssh_options, { :keys => %w( ~/.ssh/id_rsa ) }
set :password, nil # use public key