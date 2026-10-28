require 'pg'
require_relative './database_config'

class Migrations
  def self.run_all(config = DatabaseConfig.new)
    connection = PG.connect(
      host: config.host,
      port: config.port,
      user: config.user,
      password: config.password,
      dbname: config.database
    )

    connection.exec(<<~SQL)
      CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        email VARCHAR(255) NOT NULL UNIQUE,
        username VARCHAR(100) NOT NULL,
        created_at TIMESTAMP DEFAULT NOW()
      )
    SQL

    connection.close
    puts 'Migrations completed successfully'
  end
end
