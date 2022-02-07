class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_records, dependent: :destroy
  has_many :records, through: :categories_records

  validates :name, presence: true
  validates :user, presence: true
end
