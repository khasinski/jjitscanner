class Offer < ApplicationRecord
  has_many :multilocations
  has_and_belongs_to_many :skills
  has_many :employment_types
end