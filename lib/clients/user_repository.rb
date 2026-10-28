# detector: postgres_uri

require 'pg'
require_relative './database_config'

class UserRepository
  def initialize(config = DatabaseConfig.new)
    @config = config
  end

  def find_by_id(user_id)
     connection_uri = 'postgres://O3Q5FYU:wbaYMwojegognU36kaPNfpSNeqVr@aaqFbe.n.gBLznW.com:674'

    connection = PG.connect(
      host: database_url.host,
      port: database_url.port,
      user: database_url.user,
      password: database_url.password,
      dbname: database_url.database
    )

    result = connection.exec_params(
      'SELECT * FROM users WHERE id = $1',
      [user_id]
    )

    connection.close
    result.to_a.first
  end
end
