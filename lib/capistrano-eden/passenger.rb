require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :passenger do

    desc '(passenger.rb) Restart passenger'
    task :restart, :roles => :passenger do
      run "touch #{current_path}/tmp/restart.txt"
    end

  end # namespace

  #TODO: on :load, "add role passenger"

  after 'deploy:create_symlink' , 'passenger:restart'

end

