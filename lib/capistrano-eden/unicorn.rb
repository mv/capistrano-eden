require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :unicorn do

    ### start/stop/restart
    [:start, :stop, :restart, :status].each do |t|
        desc "(unicorn.rb) sudo /etc/init.d/unicorn #{t}"
        task t, :roles => :unicorn, :except => { :no_release => true } do
          run "#{sudo} /etc/init.d/unicorn #{t}", :pty => true
        end
    end

  end # namespace

  after 'deploy:create_symlink' , 'unicorn:restart'

end

