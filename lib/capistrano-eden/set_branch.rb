require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :deploy do

    desc "(branch.rb) [internal] Ensure that a branch has been selected."
    task :set_branch do

      if !exists?(:branch)
        set :branch, ENV['TAG'] || ENV['BRANCH'] || Capistrano::CLI.ui.ask('Type TAG or BRANCH or SHA1 commit. (default: master)')
        set :branch, "master" if branch.empty?
      end

    end # task

    on :load, "deploy:set_branch"
    # on :start, :set_branch
    # before  "deploy:update" , "deploy:set_branch"
    # before  "deploy:migrate", "deploy:set_branch"

  end # namespace
end

