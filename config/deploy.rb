# Require multistage for local->staging->production deployment...
require "capistrano/ext/multistage"

# Defaults...
set :scm, :git
set :git_enable_submodules, 1
set :stages, ["staging", "production"]
set :default_stage, "staging"

# This site...
project = YAML.load_file("./config/project.yml")
set :application, project['application']['name']
set :repository,  project['application']['repo']
set :app_name,    fetch(:application)
set :app_user,    project['application']['user']
set :app_group,   project['application']['group']

# set :application, "vanpattenmedia"
set :user, "deploy"

# Don't do Railsy things...
namespace :deploy do
  task :finalize_update do
    transaction do
      # do nothing
    end
  end

  task :migrate do
    # do nothing
  end

  task :restart do
    run "#{sudo} nginx -s reload"
  end
end

# Set up some VPM-specific tasks
before "deploy:setup", "puppet:show"
after "deploy:setup", "vpm:fix_setup_ownership"
before "deploy:create_symlink", "jekyll:hyde"
before "deploy:restart", "vpm:fix_deploy_ownership"

namespace :puppet do
  desc "Set up puppet"
  task :show, :roles => :app do
    run "mkdir -p /home/#{fetch(:user)}/tmp/#{fetch(:app_name)}/#{fetch(:app_stage)}"
    upload("./config/puppet/templates", "/home/#{fetch(:user)}/tmp/#{fetch(:app_name)}/#{fetch(:app_stage)}", :via => :scp, :recursive => :true)

    puppet_manifest = ERB.new(File.read("./config/puppet/templates/site.pp.erb")).result(binding)
    put puppet_manifest, "/home/#{fetch(:user)}/tmp/#{fetch(:app_name)}/#{fetch(:app_stage)}/site.pp"

    run "#{sudo} puppet apply /home/#{fetch(:user)}/tmp/#{fetch(:app_name)}/#{fetch(:app_stage)}/site.pp"
  end
end

namespace :vpm do
  desc "Fix ownership on setup"
  task :fix_setup_ownership, :roles => :app do
    run "#{sudo} chown #{app_user}:#{app_group} #{deploy_to}"
    run "#{sudo} chown -R #{user}:#{user} #{deploy_to}/releases #{deploy_to}/shared #{deploy_to}/shared/system #{deploy_to}/shared/log #{deploy_to}/shared/pids"
    run "#{sudo} chmod -R g+s #{deploy_to}/releases #{deploy_to}/shared #{deploy_to}/shared/system #{deploy_to}/shared/log #{deploy_to}/shared/pids"
  end

  desc "Fix ownership on deploy"
  task :fix_deploy_ownership, :roles => :app do
    run "#{sudo} chown --dereference -RL #{app_user}:#{app_group} #{deploy_to}/current/public"
    run "#{sudo} chmod -R g+s #{deploy_to}/current/public"
  end
end

namespace :jekyll do
  desc "Put Jekyll in its place"
  task :hyde, :roles => :app do
    system("jekyll && compass compile -e production --force")
    upload("./public", "#{current_release}", :via => :scp, :recursive => :true)
  end
end
