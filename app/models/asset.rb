class Asset < ApplicationRecord
  belongs_to :admin
  belongs_to :host_type
  belongs_to :info_type
  belongs_to :priority
end
