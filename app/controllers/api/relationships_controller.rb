class Api::RelationshipsController < ApiController
  before_action :set_target_user, only: [:create, :destroy]
  before_action :set_relationship, only: :destroy

  def create
    @relationship = Relationship.create(relation_params)
  end

  def destroy
    @relationship.destroy
  end

  private

  def set_target_user
    @target_user = User.find(params[:relationship][:followee_id])
  end

  def set_relationship
    @relationship = Relationship.find_by(relation_params)
  end

  def relation_params
    params.require(:relationship).permit(:follower_id, :followee_id)
  end
end
