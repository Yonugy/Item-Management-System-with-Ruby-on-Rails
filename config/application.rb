require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ItemBackend
  class Application < Rails::Application
    config.active_record.query_log_tags_enabled = true
    config.active_record.query_log_tags = [
      :application, :controller, :action, :job,
      current_graphql_operation: -> { GraphQL::Current.operation_name },
      current_graphql_field: -> { GraphQL::Current.field&.path },
      current_dataloader_source: -> { GraphQL::Current.dataloader_source_class },
    ]

    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
