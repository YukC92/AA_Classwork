class User < ApplicationRecord
    attr_reader :password

    after_initialize :ensure_session_token
  
    validates :name, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :session_token, :name, uniqueness: true
  
    has_many :subs,
      class_name: :Sub,
      foreign_key: :moderator_id,
      primary_key: :id,
      inverse_of: :moderator
  
    has_many :posts, inverse_of: :author
    has_many :comments, inverse_of: :author
    has_many :user_votes, inverse_of: :user
  
    def self.find_by_credentials(name, password)
      user = User.find_by(name: name)
      user.try(:is_password?, password) ? user : nil
    end
  
    def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
    end
  
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
  
    def reset_session_token!
      self.session_token = SecureRandom::urlsafe.base64
      self.save!
      self.session_token
    end
  
    private
  
    def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe.base64
    end
end
