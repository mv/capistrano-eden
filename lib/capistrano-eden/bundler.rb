require File.dirname(__FILE__) + '/../capistrano-eden' if ! defined?(CapistranoEden)

CapistranoEden.with_configuration do

  namespace :bundle do

    desc "(bundler.rb) Install gems on the remote server using Bundler."
    task :install do

#     bundle_env = fetch(:rails_env, fetch(:env, 'production'))
      bundle_env = fetch(:rails_env, fetch(:env))

      bundle_cmd = "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment"

      if [ 'production','stage','staging' ].include?(env)
        # stage/prod
        run "echo Env: #{bundle_env}; #{bundle_cmd} --without development test"
      else
        # dev/qa/test/etc
        run "echo Env: #{bundle_env}; #{bundle_cmd}"
      end

    end
    after 'deploy:update_code', 'bundle:install'

  end # namespace

end

      # run <<-CMD
      #   echo "RAILS_ENV: $RAILS_ENV"; mkdir -p #{shared_path}/bundle ;
      #   if [ "$RAILS_ENV" == "production" ];
      #   then bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test ;
      #   else bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment ;
      #   fi;
      # CMD

      # run "mkdir -p #{shared_path}/bundle"
      # run <<-CMD
      #   echo "RAILS_ENV: $RAILS_ENV";
      #   [ "$RAILS_ENV" == "production" ] && bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test ;
      # CMD
      # run <<-CMD
      #   echo "RAILS_ENV: $RAILS_ENV";
      #   [ "$RAILS_ENV" != "production" ] && bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment ;
      # CMD

#     run "mkdir -p #{shared_path}/bundle"
#     if "#{rails_env}" != 'production'
#         # dev/qa
#         run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle "
#     else
#         # stage/prod
#         run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --without development test"
#     end


