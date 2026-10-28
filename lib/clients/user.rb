class User
  attr_reader :id, :email, :username, :created_at

  def initialize(id, email, username, created_at = nil)
    @id = id
    @email = email
    @username = username
    @created_at = created_at || Time.now
  end

  def to_h
    {
      id: @id,
      email: @email,
      username: @username,
      created_at: @created_at
    }
  end

  def self.from_db_row(row)
    new(
      row['id'],
      row['email'],
      row['username'],
      Time.parse(row['created_at'])
    )
  end
end
