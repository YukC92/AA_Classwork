class Comment < ApplicationRecord

    belongs_to :commenter,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :comments,
        foreign_key: :artwork_id,
        class_name: :Artwork
end
