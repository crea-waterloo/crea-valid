class RelationRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :relation
end
