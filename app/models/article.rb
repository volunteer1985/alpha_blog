class Article < ApplicationRecord
  validates :title, presence: true, length: {mininum: 6, maximum: 100}
  validates :description, presence: true, length: {mininum: 10, maximum: 256}
end
