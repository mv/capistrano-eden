require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :deploy do

    desc <<-DESC
      (setup.rb): create initial directories for all hosts.
      For a specific host:
        $ cap HOSTS=new.server.com deploy:setup
    DESC
    task :setup, :roles => :app, :except => { :no_release => true } do

        dirs =  [ "#{base_path}"          \
                , "#{logs_path}"          \
                , "#{deploy_to}"          \
                , "#{releases_path}"      \
                , "#{releases_path}/1"    \
                , "#{shared_path}"        \
                , "#{shared_path}/config" \
                , "#{config_path}"        \
                ]

        dirs.each do |d|
            puts "  * Creating [#{d}]"
#           run "#{sudo} umask #{umask} && mkdir -p #{d}", :pty => true
            run "#{sudo} mkdir -p                #{d}", :pty => true
            run "#{sudo} chmod g+w               #{d}", :pty => true
            run "#{sudo} chown #{user}:#{ugroup} #{d}", :pty => true
        end
        run "ln -nfs #{releases_path}/1 #{deploy_to}/current"

        ### Cleaning up old 'Time.utc' releases
        run "[ -d #{releases_path}/20???????????? ] && /bin/rm -rf #{releases_path}/20????????????"

        puts "  * Dirs created."
    end
    before "deploy:setup" , "deploy:setup_vars"

  end # namespace

end


