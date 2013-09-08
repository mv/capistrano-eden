# Capistrano-Eden

Defaults and recipes used in our deployments.

Based on 'capistrano-helpers' gem:

   * https://github.com/westarete/capistrano-helpers

All deploys are expected to have **multistage** scenarios.

Some references:

   * http://help.github.com/capistrano/
   * http://help.github.com/deploy-keys
   * https://github.com/leehambley/capistrano-handbook/blob/master/index.markdown

# Usage

In any capistrano deploy recipe, simply require the helpers that contain the
functionality that you would like to add to your recipe. In most cases this
also takes care of adding the hook so that the action takes place at the right
time during deployment.

Here's an example config/deploy.rb that uses a few helpers:

    require 'capistrano-eden'         # eden defaults

    # Parameters
    set :user , 'myapp'
    set :port , 22

    set :application , 'myapp'
    set :repository  , 'git@github.com:mycompany/myapp.git'

That's it! The recipe will now also perform the actions described by the
helpers: ask for a branch, call bundle install, use multistage and so on.


# Helpers

## capistrano-eden/eden
## capistrano-eden/branch
## capistrano-eden/bundler
## capistrano-eden/git
## capistrano-eden/multistage
## capistrano-eden/passenger
## capistrano-eden/redis

Adds task to start/stop/status redis servers.

When using this helper you must specify which servers are running redis:

    server "app-ws01.example.com", :web, :app, :redis
    server "app-ws02.example.com", :web, :app, :redis
    server "app-db01.example.com", :db , :primary => true


## capistrano-eden/set_config_files

Link all desired config files, local to the deployment server inside ‘#{shared_path}/config’, to #{latest_release}/config dir.

    ### Symlink from #{shared_path}/config/
    ###           to #{latest_release}/config/
    ### i.e.
    ###     file(s) => destination_dir/

    set :config_files, {
        '*.yml'          => "config/",
        'production.rb'  => "config/environments/"
    }


## capistrano-eden/set_symlinks

During deployment, this helper replaces each of the given paths with a
symbolic link that points to files or directories that contain data
that should persist across deployments (uploads, assets, for example).

After requiring this helper, set the paths to be symlinked using the
:symlinks variable:

    ### Symlinks inside #{latest_release}
    ###     path => destination

    set :symlinks, {
        '/data/common'     => "public/common",
        '/data/tst/assets' => "public/assets",
        '/data/tst/static' => "public/static",
    }


## capistrano-eden/setup

Defines 'deploy:setup' to create all directories correctly, respecting
':umask' and 'ugroup'.


## capistrano-eden/version

Creates a VERSION file in the deployed copy that contains the name of the
branch/tag that was deployed.


# Examples


## Simple Rails Application
## PHP
## Nagios Config files
## Cacti





[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/mv/capistrano-eden/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

