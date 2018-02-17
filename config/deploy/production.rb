role :app, %w{deploy@localhost}
role :web, %w{deploy@localhost}
role :db, %w{deploy@localhost}, :primary => true
set :branch, "develop"
set :rails_env, "production"
set :deploy_to, "/home/deploy/server_code"

