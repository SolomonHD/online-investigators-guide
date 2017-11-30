role :app, %w{deploy@whpihdev1}
role :web, %w{deploy@whpihdev1}
role :db, %w{deploy@whpihdev1}, :primary => true
set :branch, "feature/redirect-logout"
set :rails_env, "development"
set :deploy_to, "/home/deploy/Apps/online-investigators-guide/"
