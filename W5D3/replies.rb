require_relative 'questionsdb.rb'
require_relative 'questions.rb'
require_relative 'users.rb'

class Reply
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum)}
  end
  
  def self.find_by_id(id)
    replies = QuestionsDB.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.id = ?
    SQL
    return nil if replies.nil?
    Reply.new(replies.first)
  end

  def self.find_by_user_id(author_id)
    replies = QuestionsDB.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.author_id = ?
    SQL
    return nil if replies.nil?
    Reply.new(replies.first)
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDB.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.question_id = ?
    SQL
    return nil if replies.nil?
    Reply.new(replies.first)
  end

  attr_reader :id, :question_id, :body, :author_id, :parent_reply

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @body = options['body']
    @author_id = options['author_id']
    @parent_reply  = options['parent_reply']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDB.instance.execute(<<-SQL, @question_id, @body, @author_id, @parent_reply)
    INSERT INTO
        replies(question_id, body, author_id, parent_reply)
    VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDB.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDB.instance.execute(<<-SQL, @question_id, @body, @author_id, @parent_reply, @id)
    UPDATE
      replies
    SET
      question_id = ?, body = ?, author_id = ?, parent_reply = ?
    WHERE
      id = ?
    SQL
  end

  def author
    User.find_by_id(author_id)
  end

  def question
    Questions.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(author_id)
  end

  def child_replies
    QuestionsDB.instance.execute(<<-SQL, parent_reply)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_reply = self.id
    SQL
  end
end