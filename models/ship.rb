class Ship < ActiveRecord::Base
  belongs_to :cruiseline
  has_many :cruises
end
