class Band < ApplicationRecord
  has_many :concerts, dependent: :destroy
  enum kind: [:band, :soloist]

  def to_s
    name
  end

  def concert_count
    self.concerts.count
  end

  def current_concert
    self.concerts.where('date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month).size
  end
end
