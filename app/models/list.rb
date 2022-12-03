class List < ApplicationRecord
  has_many :favorites
  has_many :cards, through: :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
