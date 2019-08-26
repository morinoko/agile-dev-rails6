class SupportRequest < ApplicationRecord
  belongs_to :order, optional: true

  has_rich_text :response
end
