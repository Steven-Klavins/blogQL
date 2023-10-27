# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    # =================================================
    #                     POSTS
    # =================================================

    field :create_post, Types::PostType, mutation: Mutations::CreatePost

    field :update_post, Boolean, null: false, description: "Update a post." do
      argument :post, Types::PostInputType, required: true
    end

    def update_post(post:)
      existing = Post.where(id: post.id).first
      existing&.update(post.to_h)
    end

    field :delete_post, Boolean, null: false, description: "Delete a post." do
      argument :id, ID, required: true
    end

    def delete_post(id:)
      Post.where(id: id).destroy_all
    end
  end
end
