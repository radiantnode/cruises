RAKE_PATH = File.expand_path(".")
RAKE_ENV  = ENV.fetch("RAKE_ENV", "development")

Bundler.require :default, RAKE_ENV

# Configuration for ActiveRecord rake tasks
ActiveRecord::Tasks::DatabaseTasks.root             = RAKE_PATH
ActiveRecord::Tasks::DatabaseTasks.env              = RAKE_ENV
ActiveRecord::Tasks::DatabaseTasks.db_dir           = "db"
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ["db/migrate"]
ActiveRecord::Tasks::DatabaseTasks.seed_loader      = nil

# Set up ActiveRecord database connection
ActiveRecord::Base.configurations = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection RAKE_ENV.to_sym

# Load all of our libs and models
Dir[File.join(__dir__, '..', '{lib,models}', '*.rb')].each { |file| require file }
