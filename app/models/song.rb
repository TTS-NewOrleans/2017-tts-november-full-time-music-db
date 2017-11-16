class Song < ApplicationRecord
  belongs_to :artist

  validates :name, :artist_id, :artist, presence: true

  def self.only_d_songs
    where('name LIKE "%d%"')
  end
end


# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_songs_on_artist_id  (artist_id)
#
