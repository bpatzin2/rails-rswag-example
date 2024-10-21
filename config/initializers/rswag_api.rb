Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'

  c.swagger_filter = lambda do |swagger, env|
    if env['PATH_INFO'].start_with?('/internal')
      swagger['servers'] = [{ 'url' => '/internal' }]
    elsif env['PATH_INFO'].start_with?('/customers')
      swagger['servers'] = [{ 'url' => '/customers' }]
    end
    swagger
  end
end