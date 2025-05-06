class Cruiseline < ActiveRecord::Base
  has_many :ships
  has_many :cruises
end
