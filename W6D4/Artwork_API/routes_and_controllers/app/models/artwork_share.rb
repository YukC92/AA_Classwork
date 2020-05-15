class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: {
        scope: :viewer_id, message: "only one viewer can have this artwork"
    }
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User

end 
