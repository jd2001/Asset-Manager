class BusinessAsset < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :host_type
  belongs_to :info_type
  belongs_to :priority
  has_many :accesses
  has_many :employees, through: :accesses
end
