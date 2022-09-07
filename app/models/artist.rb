class Artist < ApplicationRecord
  has_many :tracks, dependent: :destroy
  has_many :downloads, dependent: :destroy
  has_many :download_songs, through: :downloads, foreign_key: 'song_id'

  validates :name, presence: true

  scope :top, -> (letter, count) { where('name LIKE ?', '%' + "#{letter}" + '%')
                                   .joins(:tracks)
                                   .where('download_count >= ?', "#{count}" )}

  def songs
    songs ||= tracks.order(:title)
  end

  def songs_top
    songs_top ||= tracks.order(download_count: :desc)
  end
end
