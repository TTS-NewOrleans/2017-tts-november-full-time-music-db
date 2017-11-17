class Song < ApplicationRecord
  belongs_to :album

  validates :name, :album_id, :album, presence: true
  validates_uniqueness_of :name, scope: :album



end


# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#
# Indexes
#
#  index_songs_on_album_id  (album_id)
#
