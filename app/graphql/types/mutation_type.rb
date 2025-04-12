# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_item, mutation: Mutations::CreateItem
    field :toggle_favourite, mutation: Mutations::ToggleFavourite
  end
end
