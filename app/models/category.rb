class Category < ApplicationRecord
  validates_presence_of :catid, :catname
  validates_uniqueness_of :catid
end
