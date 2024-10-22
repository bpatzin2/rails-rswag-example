Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'

  c.swagger_filter = lambda do |swagger, env|
    swagger['servers'] = [{ 'url' => '' }]
    swagger
  end
end