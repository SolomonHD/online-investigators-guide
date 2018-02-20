ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['PATH'] = "#{ENV['NODE_JS_PATH']}:#{ENV['PATH']}" #put this line in config/boot.rb

require 'bundler/setup' # Set up gems listed in the Gemfile.
