require_relative 'questionsdb.rb'
require_relative 'questions.rb'
require_relative 'replies.rb'

class User
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum)}
  end
  
  def self.find_by_id(id)
    user = QuestionsDB.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      users.id = ?
    SQL
    return nil if user.nil?
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    name = QuestionsDB.instance.execute(<<-SQL, fname, lname)
    SELECT
        *
    FROM
        users
    WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless name.length > 0
    User.new(name.first)
  end

  attr_accessor :id, :fname, :lname
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDB.instance.execute(<<-SQL, @fname, @lname)
    INSERT INTO
        users(fname, lname)
    VALUES
        (?, ?)
    SQL
    @id = QuestionsDB.instance.last_insert_row_id
  end

  def authored_questions
    Questions.find_by_author_id(users.id)
  end

  def authored_replies
    Reply.find_by_user_id
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(self.id)
  end

end