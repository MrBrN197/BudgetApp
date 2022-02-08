class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_records, dependent: :destroy
  has_many :records, through: :categories_records

  validates :name, presence: true
  validates :user, presence: true


  def first_three_transactions
    records.limit(3)
  end

end
