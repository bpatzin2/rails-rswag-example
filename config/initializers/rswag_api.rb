Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'

  # Add a filter to modify the Swagger JSON to include the new base path
  c.swagger_filter = lambda do |swagger, env|
    swagger['servers'] = [{ 'url' => '/test-path' }]
    swagger
  end
end