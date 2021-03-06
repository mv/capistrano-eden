require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)
require File.dirname(__FILE__) + '/branch'

CapistranoEden.with_configuration do

  namespace :deploy do

    desc "(version.rb) [internal] Write the name of the tag that we're deploying to a VERSION file"
    task :write_version_file do

      if    ENV['TAG']    then _msg = "TAG=#{branch}"
      elsif ENV['BRANCH'] then _msg = "BRANCH=#{branch}"
      else                     _msg = "set :branch, '#{branch}'"
      end

      puts "  * Version [#{_msg}]"
      run "echo  '#{_msg}' >  #{release_path}/VERSION"
    end
    after "deploy:update_code", "deploy:write_version_file"

  end # namespace

end

