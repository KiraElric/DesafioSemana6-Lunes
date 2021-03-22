class Band < ApplicationRecord
  has_many :concerts, dependent: :destroy
end
