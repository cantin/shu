default_run_options[:pty] = true

set :application, 'shu'
set :repository,  "git://github.com/cantin/shu.git"
set :branch, 'ubuntu'
set :rails_env, 'development'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deploy'
set :use_duso, false
set :deploy_to, "/home/#{user}/apps/#{application}/#{rails_env}"

set :server_domain, 'shu.me'

role :web, server_domain
role :app, server_domain
role :db, server_domain
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
