require 'mina/rails'
require 'mina/git'
require 'mina/unicorn'
require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
# require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'sunflower'
set :domain, '138.197.138.239'
set :deploy_to, '/var/www/sunflower'
set :repository, 'git@github.com:tinyfive/sunflower.git'
set :branch, 'master'

set :unicorn_env, 'production'
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"
set :unicorn_cmd, "bundle exec /var/www/sunflower/current/vendor/bundle/ruby/2.3.0/bin/unicorn"

# Optional settings:
set :user, 'sonic'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
set :forward_agent, true    # SSH forward_agent.

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# set :shared_dirs, fetch(:shared_dirs, []).push('somedir')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/application.yml', 'config/unicorn.rb', 'tmp/sockets', 'tmp/pids')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-1.9.3-p125@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
  # command %{touch "#{deploy_to}/#{shared_path}/config/database.yml"}
  # command %{touch "#{deploy_to}/#{shared_path}/config/application.yml"}
  # command %{touch "#{deploy_to}/#{shared_path}/config/secrets.yml"}
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}

        invoke :'unicorn:restart'
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
