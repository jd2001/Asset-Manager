class Employee < ApplicationRecord
  belongs_to :company
  has_many :accesses
  has_many :business_assets, through: :accesses
end
