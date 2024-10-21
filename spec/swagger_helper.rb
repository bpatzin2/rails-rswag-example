require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'internal/v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'Internal API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: '/internal',
          description: 'Internal server'
        }
      ]
    },
    'customers/v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'Customers API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: '/customers',
          description: 'Customers server'
        }
      ]
    }
  }

  config.swagger_format = :json
end