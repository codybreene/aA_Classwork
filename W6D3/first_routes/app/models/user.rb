class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    dependent: :destroy,
    primary_key: :id, 
    foreign_key: :artist_id,
    class_name: :Artwork 

  has_many :views,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    dependent: :destroy,
    through: :views,
    source: :artwork

  has_many :comments,
    dependent: :destroy,
    primary_key: :id, 
    foreign_key: :author_id,
    class_name: :Comment 

  

end
