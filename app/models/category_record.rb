class CategoryRecord < ApplicationRecord
  self.table_name = 'categories_records'
  belongs_to :record
  belongs_to :category
end
