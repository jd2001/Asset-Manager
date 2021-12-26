class Application < ApplicationRecord
  belongs_to :info_type
  belongs_to :host_type
end
