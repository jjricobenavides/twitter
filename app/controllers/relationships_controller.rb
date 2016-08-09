class RelationshipsController < ApplicationController
  # POST /relationships

   def create
    @relationship = current_user.relationships.new(friend_id: params[:friend_id])
    if @relationship.save
      redirect_to request.referrer, notice: "Followed successfully."
    else
      redirect_to request.referrer, notice: "Unable to follow."
    end
  end
end
