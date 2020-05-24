class Card < ApplicationRecord
  belongs_to :list
  include RankedModel
  ranks :row_order
  validates :title, length: { in: 1..255 }
  validates :memo,  length: { maximum: 1000 }
end
