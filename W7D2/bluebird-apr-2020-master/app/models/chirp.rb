# == Schema Information
#
# Table name: chirps
#
#  id        :bigint           not null, primary key
#  body      :text             not null
#  author_id :integer          not null
#
class Chirp < ApplicationRecord
  
  validates :body, presence: true
  validates :author_id, presence: true

  validate :body_too_long


  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :likes,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :user


  def body_too_long
    if body && body.length > 140
      errors[:body] << 'too long'
    end
  end

  #inefficient
  # def self.all_chirps_authors
  #   chirps = Chirp.all 
  #   debugger
  #   chirps.each do |chirp|
  #     debugger
  #     puts chirp.author.username
  #   end
  #   debugger
  #   nil
  # end

 def self.all_chirps_authors
    chirps = Chirp.includes(:author).all #pre-fetch data
    
    chirps.each do |chirp|
      puts chirp.author.username
    end

    nil
  end


end
