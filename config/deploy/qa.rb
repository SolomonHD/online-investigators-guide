role :app, %w{deploy@whrailsqa1}
role :web, %w{deploy@whrailsqa1}
role :db, %w{deploy@whrailsqa1}, :primary => true
set :branch, "develop"
set :rails_env, "qa"
set :deploy_to, "/home/deploy/Apps/online-investigators-guide/"
