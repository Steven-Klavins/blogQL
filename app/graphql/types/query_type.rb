# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: true, description: "Returns one instance of a user." do
      argument :id, ID, required: true
    end

    def user(id:)
      User.where(id: id).first
    end

    field :post, Types::PostType, null: true, description: "Returns one instance of a post." do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.where(id: id).first
    end

    field :comment, Types::CommentType, null: true, description: "Returns one instance of a comment." do
      argument :id, ID, required: true
    end

    def comment(id:)
      Comment.where(id: id).first
    end
  end
end
