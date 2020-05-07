require_relative 'questionsdb.rb'
require_relative 'questions.rb'
require_relative 'users.rb'

class QuestionFollows
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum)}
  end
  
  def self.find_by_id(id)
    question_follows = QuestionsDB.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      question_follows
    WHERE
      question_follows.id = ?
    SQL
    return nil if question_follows.nil?
    QuestionFollows.new(question_follows.first)
  end

  def self.followers_for_question_id(questions_id)
    user_object = QuestionsDB.instance.execute(<<-SQL, questions_id)
    SELECT
      users.*
    FROM
      users
    JOIN
      question_follows ON users.id = question_follows.users_id
    WHERE
      question_follows.questions_id = ?
    SQL

    user_object.map {|options_hash| User.new(options_hash)}
  end

  def self.followed_questions_for_user_id(user_id)
    question_object = QuestionsDB.instance.execute(<<-SQL, user_id)
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.questions_id
    WHERE
      question_follows.users_id = ?
    SQL

    question_object.map {|options_hash| Questions.new(options_hash)}
  end

  def self.most_followed_questions(n)
    most_questions = QuestionsDB.instance.execute(<<-SQL, n)
    SELECT
      *
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.questions_id
    GROUP BY
      question_id
    ORDER BY
      COUNT(*) DESC
    LIMIT
      ?
    SQL
    most_questions.map {|most| Questions.new(most)}
  end

  def initialize(options)
    @id = options['id']
    @users_id = options['users_id']
    @questions_id = options['questions_id']
  end

end