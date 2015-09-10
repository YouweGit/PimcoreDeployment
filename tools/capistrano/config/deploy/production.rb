
set :rails_env, 'testing'

server 'live-psg.pimcore.prelive.nl:222', :app, :web, :primary => true

set :scm, :git
set :deploy_to, '/deployment'
set :deploy_via, :remote_cache

set :stage_domain,  'live-psg.pimcore.prelive.nl:222'
set :stage_branch,  'development'

# capistrano doesnt suppert to deploy to the same machine.
role :app, 'live-psg.pimcore.prelive.nl:222', :master => true

set :use_sudo, false
set :user, '3oZuX0wq'
set :ssh_options, { :keys => %w( ~/.ssh/id_rsa ) }
set :password, nil # use public key
