role :app, %w{deploy@whpihdev1}
role :web, %w{deploy@whpihdev1}
role :db, %w{deploy@whpihdev1}, :primary => true
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
#set :branch, "develop"
set :rails_env, "development"
set :deploy_to, "/home/deploy/Apps/online-investigators-guide/"
