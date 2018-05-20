class Category < ApplicationRecord
  belongs_to :budget
  validates_presence_of :name
  has_many :line_items, dependent: :destroy
end
