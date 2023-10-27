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

    # =================================================
    #                    COMMENTS
    # =================================================

    field :create_comment, Types::CommentType, mutation: Mutations::CreateComment

    field :update_comment, Boolean, null: false, description: "Update a comment." do
      argument :comment, Types::CommentInputType, required: true
    end

    def update_comment(comment:)
      existing = Comment.where(id: comment.id).first
      existing&.update(comment.to_h)
    end

    field :delete_comment, Boolean, null: false, description: "Delete a comment." do
      argument :id, ID, required: true
    end

    def delete_comment(id:)
      Comment.where(id: id).destroy_all
    end

    # =================================================
    #                    USERS
    # =================================================

    field :create_user, Types::UserType, mutation: Mutations::CreateUser

    field :update_user, Boolean, null: false, description: "Update a user." do
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.where(id: user.id).first
      existing&.update(user.to_h)
    end

    field :delete_user, Boolean, null: false, description: "Delete a user." do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      User.where(id: id).destroy_all
    end
  end
end
