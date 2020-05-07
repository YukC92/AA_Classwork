require_relative 'questionsdb.rb'
require_relative 'questions.rb'
require_relative 'users.rb'

class QuestionLikes
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLikes.new(datum)}
  end
  
  def self.find_by_id(id)
    question_likes = QuestionsDB.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      question_likes
    WHERE
      question_likes.id = ?
    SQL
    return nil if question_likes.nil?
    QuestionLikes.new(question_likes.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end