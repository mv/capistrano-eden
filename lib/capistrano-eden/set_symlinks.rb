require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :deploy do

    desc '(symlinks.rb) [internal] Replace named files with a symlink to their counterparts in shared/'
    task :do_symlinks do

      if !exists?(:symlinks)
        abort 'You must specify "set :symlinks" command. See README.'
      end

      # Pre-req: eden.rb
      deploy.setup_vars

      # Create links
      symlinks.each do |path,destination|

        raise "Release path is nil!"     if release_path.nil? || release_path.empty?
        raise "Path is nil!"             if path.nil?         || path.empty?
        raise "Destination path is nil!" if destination.nil?

        run "rm -rf #{release_path}/#{destination} && ln -nsf #{path} #{release_path}/#{destination}"

      end

    end
    after "deploy:symlink", "deploy:do_symlinks"

  end # namespace

end

