class Bot < ApplicationRecord
  has_many :parameters
  accepts_nested_attributes_for :parameters, reject_if: :all_blank, allow_destroy: true
end
