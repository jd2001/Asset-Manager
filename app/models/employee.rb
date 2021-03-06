class Employee < ApplicationRecord
  belongs_to :company
  has_many :accesses
  has_many :business_assets, through: :accesses

  def full_name
    first_name + ' ' + surname
  end
end