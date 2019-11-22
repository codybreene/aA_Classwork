class ArtworkShare < ApplicationRecord
  #change error messages to be more discriptive
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "has already been shared to that user" }

  belongs_to :artwork,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork 

  belongs_to :viewer,
    primary_key: :id, 
    foreign_key: :viewer_id, 
    class_name: :User 


end
