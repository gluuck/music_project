class Track < ApplicationRecord
  belongs_to :artist

  has_many :downloads, dependent: :destroy
  has_many :download_songs, through: :downloads, foreign_key: 'artist_id'

  validates :title, :length, :filesize, presence: true

  def self.top(day, count)
    where(created_at: "#{day.days.ago}"..Time.now).where('download_count >= ?', "#{count}")
  end
end
