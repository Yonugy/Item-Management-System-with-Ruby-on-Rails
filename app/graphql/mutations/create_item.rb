# frozen_string_literal: true

module Mutations
  class CreateItem < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    argument :title, String, required: true
    argument :category, String, required: true
    argument :is_favorite, Boolean, required: false

    field :item, Types::ItemType
    field :errors, [String], null: false

    def resolve(title:, category:, is_favorite: false)
      item = Item.new(title: title, category: category, is_favorite: is_favorite)
      if item.save
        {
          item: item,
          errors: []
        }
      else
        {
          item: nil,
          errors: item.errors.full_messages
        }
      end
    end
  end
end
