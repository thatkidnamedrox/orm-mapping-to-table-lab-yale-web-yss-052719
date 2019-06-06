class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  @@all = []
  attr_accessor :name, :grade

  def initialize(attributes)
    attributes.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_table
    sql = <<-SQL
     CREATE TABLE IF NOT EXISTS students (
       id INTEGER PRIMARY KEY,
       name TEXT,
       grade INTEGER
     )
     SQL
    DB[:conn].execute(sql)
  end

end
