class SupportRequest < ApplicationRecord
  belongs_to :order, optional: true
end
