# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }

# If the environment differs from the stage name
# set :rails_env, 'staging'
#
# # Defaults to :db role
# set :migration_role, :db
#
# # Defaults to the primary :db server
# set :migration_servers, -> { primary(fetch(:migration_role)) }
#
# # Defaults to false
# # Skip migration if files in db/migrate were not modified
# set :conditionally_migrate, true
#
# # Defaults to [:web]
# set :assets_roles, [:web, :app]
#
# # Defaults to 'assets'
# # This should match config.assets.prefix in your rails config/application.rb
# set :assets_prefix, 'prepackaged-assets'
#
# # RAILS_GROUPS env value for the assets:precompile task. Default to nil.
# set :rails_assets_groups, :assets
#
# # If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
# set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}
#
# # Defaults to nil (no asset cleanup is performed)
# # If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# # set this to the number of versions to keep
# set :keep_assets, 2
set :stage, :staging

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
server 'whpihdev1', user: 'deploy', roles: %w{app web db}


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}


role :app, %w{deploy@whpihdev1}
role :web, %w{deploy@whpihdev1}
role :db, %w{deploy@whpihdev1}, :primary => true
set :branch, "develop"
set :rails_env, "staging"
set :deploy_to, "/home/deploy/Apps"
