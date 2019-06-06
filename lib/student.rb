class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  @@all = []
  attr_reader :id
  attr_accessor :name, :grade

  def initialize(name, grade)
    @id = nil
    @name = name
    @grade = grade
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

  def self.drop_table
    sql = <<-SQL
     DROP TABLE students
     SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO daily_show_guests (year, googleknowledge_occupation, show, gr, raw_guest_list)
      VALUES (?,?,?,?,?)
      SQL
    
    DB[:conn].execute(sql, self.year, self.googleknowledge_occupation, self.show, self.group, self.raw_guest_list)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM daily_show_guests")[0][0]
  end

end
