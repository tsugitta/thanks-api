class RelationshipsController < ApplicationController
  before_action :set_relationship, only: :destroy

  def create
    Relationship.create(relation_params)
  end

  def destroy
    @Relationship.destroy
  end

  private

  def set_relationship
    @relationship = Relationship.find(relation_params)
  end

  def relation_params
    params.require(:relation).permit(:follower_id, :followee_id)
  end
end
