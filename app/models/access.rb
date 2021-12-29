class Access < ApplicationRecord
  belongs_to :business_asset
  belongs_to :employee
end
