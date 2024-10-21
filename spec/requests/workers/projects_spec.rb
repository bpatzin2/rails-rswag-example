# spec/requests/workers/projects_spec.rb
require 'swagger_helper'

RSpec.describe 'Workers::Projects API', type: :request do
  path '/workers/projects' do
    get 'Retrieves all projects' do
      tags 'Worker Projects'
      produces 'application/json'

      response '200', 'successful' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string }
                 },
                 required: ['id', 'name']
               }

        run_test!
      end
    end

    post 'Creates a project' do
      tags 'Worker Projects'
      consumes 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'project created' do
        let(:project) { { name: 'Test Project' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:project) { { name: '' } }
        run_test!
      end
    end
  end
end