class Vitae < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :jobs
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :refs
end
