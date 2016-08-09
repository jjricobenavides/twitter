class Relationship < ActiveRecord::Base
    belongs_to :user #This is the user that initiates the action
    belongs_to :friend, class_name: "User" #This is the user being followed
    
    def create 
        @relationship = current_user.relationships.new(friend_id: params[:friend_id])
        if @relationship.save
            redirect_to request.referrer, notice: "Followed successfully."
        else
            redirect_to request.referrer, notice: "Unable to follow"
        end
    end
end
