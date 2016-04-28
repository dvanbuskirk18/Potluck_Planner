# Stores user's and dish's dietary restriction info; not currently implemented.
class DietaryRestriction < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish
end
