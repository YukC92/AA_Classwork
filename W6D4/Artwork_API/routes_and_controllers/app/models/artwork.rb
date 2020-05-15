class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: :artist_id, message: "artist can only have one of each title"
    }
    validates :image_url, presence: true
    validates :artist_id, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_artwork,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
        
    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shared_artwork,
        source: :viewer

    def self.artwork_viewers_artist(user_id)
        Artwork
            .joins(:shared_artwork)
            .where("artwork_shares.viewer_id = #{user_id} OR artworks.artist_id = #{user_id}")
            
    end  
end