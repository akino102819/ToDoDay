class List < ApplicationRecord
  include RankedModel
  ranks :row_order
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :title, length: { in: 1..255 }
end
