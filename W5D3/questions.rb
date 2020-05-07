require_relative 'questionsdb.rb'
require_relative 'users.rb'
require_relative 'replies.rb'
require_relative 'question_follows.rb'

class Questions
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum)}
  end
  
  def self.find_by_id(id)
    questions = QuestionsDB.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      questions
    WHERE
      questions.id = ?
    SQL
    return nil if questions.nil?
    Questions.new(questions.first)
  end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDB.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      questions.author_id = ?
    SQL
    return nil if questions.nil?
    Questions.new(questions.first)
  end


  attr_accessor :title, :body, :id, :author_id
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDB.instance.execute(<<-SQL, @title, @body, @author_id)
    INSERT INTO
        questions(title, body, author_id)
    VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDB.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDB.instance.execute(<<-SQL, @title, @body, @author_id, @id)
    UPDATE
      questions
    SET
      title = ?, body = ?, author_id = ?
    WHERE
      id = ?
    SQL
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end
end

