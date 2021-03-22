class Band < ApplicationRecord
  has_many :concerts, dependent: :destroy
  enum kind: [:band, :soloist]

  def concert_count
    
  end
end
