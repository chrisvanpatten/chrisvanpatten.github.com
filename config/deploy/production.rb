# Server options
server "50.116.59.75", :app, :web, :db, :primary => true
ssh_options[:port]        = 9012
default_run_options[:pty] = true

# Set stage
set :app_stage,  "production"

# nginx config
project = YAML.load_file("./config/project.yml")
set :app_domain, project['application']['domain']

# Deploy path
set :deploy_to, "/home/#{fetch(:app_user)}/#{fetch(:app_domain)}"
set :app_deploy_to, fetch(:deploy_to)