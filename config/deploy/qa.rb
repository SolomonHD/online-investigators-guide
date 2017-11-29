role :app, %w{deploy@whrailsqa1}
role :web, %w{deploy@whrailsqa1}
role :db, %w{deploy@whrailsqa1}, :primary => true
set :branch, "feature/create-user-table"
set :rails_env, "production"
set :deploy_to, "/home/deploy/Apps/online-investigators-guide/"
