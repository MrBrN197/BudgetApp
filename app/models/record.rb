class Record < ApplicationRecord
  belongs_to :user
  has_many :categories_records, dependent: :destroy
  has_many :categories, through: :categories_records

  validates :name, presence: true
  validates :ammount, numericality: { greater_than: 0 }
end
