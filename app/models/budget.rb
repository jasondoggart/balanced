class Budget < ApplicationRecord
  validates_presence_of :name
  has_many :categories, dependent: :destroy
end
