# config/deploy.rb

set :normalize_asset_timestamps, false

# stages
set :stages, %w(acceptance testing production live)
set :default_stage, 'testing'
require 'capistrano/ext/multistage'
require 'pathname'

# repository, sourcecode.
set :application,'psg'
set :scm, :git
set :repository, 'ssh://git@source.youwe.nl:7999/psg/psg-pimcore.git'

# set :deploy_via, :remote_cache
set :app_webroot, "/htdocs"

# ssh, options/server
set :keep_releases, 3
set :use_sudo, false
set :ssh_options, { :forward_agent => true, :keys => %w( ~/.ssh/id_rsa ) }

default_run_options[:pty] = true

# app links
set :app_symlinks, ["#{app_webroot}/website/var/assets", "#{app_webroot}/website/var/backup", "#{app_webroot}/website/var/log", "#{app_webroot}/website/var/versions", "#{app_webroot}/website/var/recyclebin", "#{app_webroot}/website/var/tmp", "#{app_webroot}/website/var/config"]
set :app_shared_dirs, ["#{app_webroot}/website/var", "#{app_webroot}/pimcore", "#{app_webroot}/plugins"]
set :app_shared_files, []


# capistrano flow

# 1. deploy:setup
#   if application is never deployed, use deploy:cold
# 2. deploy               -> update, restart
# 3. deploy:cold          -> update, start
# 4. deploy:update        -> update_code, create_symlink
# 5. deploy:update_code   -> finalize_update
# 6. deploy:restart       ->
# 7. deploy:start         ->

# flow pimcore

# 1. deploy:setup create symlinks, shared files and set folder rights

# namespace/pimcore tasks
namespace :pimcore do
    desc <<-DESC
        Sets the world writable on the :setup directories
    DESC
    task :setup, :except => { :no_release => true } do
        if app_symlinks
            app_symlinks.each { |link| run "#{try_sudo} mkdir -p #{shared_path}#{link}"}
        end
        if app_shared_files
            app_shared_files.each { |link| run "#{try_sudo} touch #{shared_path}#{link}"}
        end
    end
    desc <<-DESC
        Touches up the released code. This is called by update_code \
        after the basic deploy finishes.

        Any directories deployed from the SCM are first removed and then replaced with \
        relative symlinks to the same directories within the shared location.
    DESC
    task :finalize_update, :roles => [:web, :app], :except => { :no_release => true } do
        run "chmod -R g+w #{latest_release}" if fetch(:group_writable, true)
        if app_symlinks
            # Remove the contents of the shared directories if they were deployed from SCM
            app_symlinks.each { |link| run "#{try_sudo} rm -rf #{latest_release}#{link}" }
            # Add symlinks the directoris in the shared location
            app_symlinks.each { |link| pathname_latest_release_link = Pathname.new(File.dirname(latest_release+link))
                pathname_shared_path_link = Pathname.new(shared_path+link)
                relative_shared_path = pathname_shared_path_link.relative_path_from(pathname_latest_release_link)

                run "ln -vnfs #{relative_shared_path} #{latest_release}#{link}"
                #run "ln -vnfs #{shared_path}#{link} #{latest_release}#{link}"
            }
        end
        if app_shared_files
          # Remove the contents of the shared directories if they were deployed from SCM
          app_shared_files.each { |link| run "#{try_sudo} rm -rf #{latest_release}/#{link}" }
          # Add symlinks the directoris in the shared location
          app_shared_files.each { |link| pathname_latest_release_link = Pathname.new(File.dirname(latest_release+link))
            pathname_shared_path_link = Pathname.new(shared_path+link)
            relative_shared_path = pathname_shared_path_link.relative_path_from(pathname_latest_release_link)
            run "ln -vs #{relative_shared_path} #{latest_release}#{link}"
            #run "ln -s #{shared_path}#{link} #{latest_release}#{link}"
          }
        end
    end
end

after 'deploy:setup', 'pimcore:setup'
after 'deploy:finalize_update' , 'pimcore:finalize_update'