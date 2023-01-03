require "bundler/setup"

load "active_record/railties/databases.rake"

task :environment do
  require "./config/application"
end

task :console => :environment do
  require "irb"

  ARGV.clear
  IRB.start
end

task :import => :environment do
  CruiseImporter.new.import
end
