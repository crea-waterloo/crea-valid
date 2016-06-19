class RelationRatingsController < ApplicationController
  respond_to :js

  def create
    RelationRating.new(user: current_user).update(relation_rating_params)
  end

  def update
    relation_rating_params.merge!(user_id: current_user.id)
    RelationRating.update(relation_ratings_params)
  end

  def relation_rating_params
    params.require(:relation_rating)
          .permit(:user_id,
                  :relation_id,
                  :value,
                  :comment)
  end
end
