require 'rubygems'
require 'rake'

task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "capistrano-abril"
    gem.summary     = %Q{Defaults and recipes used in our deployments.}
    gem.description = %Q{Defaults and recipes used in our deployments. Based on 'capistrano-helpers' gem.}
    gem.homepage    = "http://github.com/abril/capistrano-abril"
    gem.authors     = ["Marcus Vinicius Ferreira"]
    gem.email       = "ferreira.mv@gmail.com"
    gem.add_dependency('capistrano', '~> 2.12.0')
#   gem.add_dependency('git', '1.2.5')
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
# task :test do |test|  # ??
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

# begin
#   require 'rcov/rcovtask'
#   Rcov::RcovTask.new do |test|
#     test.libs << 'test'
#     test.pattern = 'test/**/*_test.rb'
#     test.verbose = true
#   end
# rescue LoadError
#   task :rcov do
#     abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
#   end
# end

# require 'rake/rdoctask'
# Rake::RDocTask.new do |rdoc|
#   if File.exist?('VERSION.yml')
#     config = YAML.load(File.read('VERSION.yml'))
#     version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
#   else
#     version = ""
#   end
#
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title    = "capistrano-abril #{version}"
#   rdoc.rdoc_files.include('README*')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end

