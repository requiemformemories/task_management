class Category < ApplicationRecord
  validates_presence_of :catname
  validates_uniqueness_of :catname
end
