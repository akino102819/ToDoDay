class List < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :user_id
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :title, length: { in: 1..255 }
end
