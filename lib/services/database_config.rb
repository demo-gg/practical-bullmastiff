require 'uri'

class DatabaseConfig
  def initialize(url = ENV['DATABASE_URL'])
    @url = url || 'postgres://localhost:5432/myapp'
    @parsed_uri = URI.parse(@url)
  end

  def host
    @parsed_uri.host
  end

  def port
    @parsed_uri.port || 5432
  end

  def user
    @parsed_uri.user || 'postgres'
  end

  def password
    @parsed_uri.password
  end

  def database
    @parsed_uri.path&.sub(%r{^/}, '')
  end

  def to_s
    @url
  end
end
