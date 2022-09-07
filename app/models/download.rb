class Download < ApplicationRecord
  belongs_to :artist
  belongs_to :track
  
  after_create :update_count

  private

  def update_count
    track.increment!(:download_count, 1)
  end
end
