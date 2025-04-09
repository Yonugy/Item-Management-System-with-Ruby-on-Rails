module Mutations
  class ToggleFavourite < BaseMutation
    argument :id, ID, required: true, description: "ID of the item to toggle favorite status"

    field :item, Types::ItemType, null: true, description: "The updated item"

    def resolve(id:)
      item = Item.find_by(id: id)
      return { item: nil } unless item

      # Toggle the `is_favorite` field
      item.update!(is_favorite: !item.is_favorite)

      { item: item }
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, "Item not found"
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.message
    end
  end
end