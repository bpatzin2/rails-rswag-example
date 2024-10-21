Rswag::Ui.configure do |c|
  c.swagger_endpoint '/test-path/api-docs/v1/swagger.json', 'API V1 Docs'

  # Add Basic Auth in case your API is private
  # c.basic_auth_enabled = true
  # c.basic_auth_credentials 'username', 'password'
end