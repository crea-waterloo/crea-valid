class RelationsController < ApplicationController
  def index
    @relations = Relation.all
  end

  def validate
    @user = current_user
    @relations = Relation.all
    @ratings = RelationRating.all.where(user: current_user)
  end

end
