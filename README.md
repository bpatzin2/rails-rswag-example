# Rails Multi-API OpenAPI with rswag and Sorbet

## Overview

This Rails application demonstrates how to host multiple OpenAPI schemas for a single Rails app using rswag. It showcases two different APIs: "internal" and "customers" as examples.

## Brian's Todo List for This Project

- [x] Setup rswag
- [x] Host multiple API schemas
- [x] Custom endpoints for hosting Swagger UIs (so they can be separated and authed)
- [x] Incorporate Sorbet
- [ ] Validate with Sorbet
- [ ] Make sure Sorbet is used in one controller and json schema in the other
- [ ] Crisp readme with code snippets and UI screenshots
- [ ] Custom endpoints for hosting schema JSONs (so they can be authed)
- [ ] UI and API URLs should align and include version number
- [ ] Code-gen Python and TypeScript clients and write integration tests for each
- [ ] Include "intended benifits" or something like that in this README
- [ ] Improve "how it works" section below
- [ ] Investigate using refs in the OpenAPI schema

## How It Works

This application uses rswag to generate and serve OpenAPI documentation for two separate APIs within the same Rails application. The `swagger_helper.rb` file defines the structure for both API schemas, while the `routes.rb` file sets up the endpoints for serving the documentation and UI.

The `rswag_api.rb` initializer configures how the API documentation is served, including a custom filter to adjust the server URL based on the requested API.

[Rswag](https://github.com/rswag/rswag) is broken down into three main components:
1. Generating the OpenAPI file
2. Serving the file for download
3. Serving the UI for API exploration

## Setup Instructions

1. Clone the repository
2. Install Ruby 3.3.0 (if not already installed)
3. Install PostgreSQL (if not already installed)
4. Run `bundle install` to install dependencies
5. Run `rails db:create db:migrate` to set up the database
6. Start the Rails server with `rails s`

## Accessing the API Documentation

### Swagger UI URLs
- Internal API: `http://localhost:3000/internal/api-docs`
- Customers API: `http://localhost:3000/customers/api-docs`

### API Schema Download URLs
- Internal API: `http://localhost:3000/internal/api-docs/internal/v1/swagger.json`
- Customers API: `http://localhost:3000/customers/api-docs/customers/v1/swagger.json`

## Key Files
TODO: Explain what each file does
- Swagger Helper: `app/helpers/swagger_helper.rb`
- Routes: `config/routes.rb`
- Initializers: `config/initializers/rswag_api.rb` and `config/initializers/rswag_ui.rb`
