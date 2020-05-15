class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :viewers,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :comments,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy
        
    has_many :shared_artworks,
        through: :viewers,
        source: :artwork


    def self.search(search)
        if search
            User
                .where('username LIKE ?', "%#{search}%")
        else
            User.all
        end
    end
end
