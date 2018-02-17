ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['PATH'] = "/home/deploy/paths/nodejs-current:#{ENV['PATH']}"

require 'bundler/setup' # Set up gems listed in the Gemfile.
