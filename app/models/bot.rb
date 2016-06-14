class Bot < ApplicationRecord
  has_many :entities
  accepts_nested_attributes_for :entities, reject_if: :all_blank, allow_destroy: true
end
