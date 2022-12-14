# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

  validates :image_url, presence: true, uniqueness: true 
  validates :title, presence: true, uniqueness: { scope: :author_id,
    message: "artist not have repeating titles"}

  belongs_to :artist, 
    primary_key: :id, 
    foreign_key: :artist_id,
    class_name: :User

    

end
