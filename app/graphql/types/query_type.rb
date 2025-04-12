# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :items, [Types::ItemType], null: false, description: "Fetch all items" do
      argument :search, String, required: false, description: "Search term to filter items"
      argument :filter_by, String, required: false, description: "Filter by either title or category"
      argument :sort_by, String, required: false, default_value: 'created_at', description: "Field to sort by"
      argument :sort_order, String, required: false, default_value: 'desc', description: "Sort order (asc or desc)"
      argument :favourite, Boolean, required: false, description: "Enable favourite only"
      argument :categories, [String], required: false, description: "Filter by categories"
    end

    # Resolver for fetching all items
    def items(search: nil, filter_by:, sort_by:, sort_order:, favourite: false, categories: [])
      query = Item.all

      if search.present?
        if filter_by == "title"
          query = query.where("title LIKE ?", "%#{search}%")
        elsif filter_by == "category"
          query = query.where("category LIKE ?", "%#{search}%")
        end
      end

      if (favourite)
        query = query.where(is_favorite: true)
      end

      query = query.where(category: categories) if categories.any?
      # Apply sorting based on the `sort_by` and `sort_order` arguments
      query = query.order("#{sort_by} #{sort_order}")

      query
    end

    field :categories, [String], null: false, description: "Fetch all unique categories"

    def categories
      Item.distinct.pluck(:category)
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
  end
end
