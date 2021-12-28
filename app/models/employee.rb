class Employee < ApplicationRecord
  belongs_to :company
  has_many :accesses
  has_many :assets, through: :accesses
end
