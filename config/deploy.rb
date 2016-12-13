# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'silicon_balls'
set :repo_url, 'https://github.com/michaeldawson/silicon-balls.git'
set :deploy_to, '/var/www/silicon_balls'
set :unicorn_service, -> { "unicorn_#{fetch(:application)}" }
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
append :linked_files, '.env'
