require 'swagger_helper'

RSpec.describe 'Internal::Projects API', type: :request, swagger_doc: 'internal/v1/swagger.json' do
  path '/projects' do
    get 'Retrieves all projects' do
      tags 'Internal Projects'
      produces 'application/json'

      response '200', 'successful' do
        schema type: :array,
               items: ::Internal::ProjectsController::Project.to_json_schema

               let!(:project) { ::Project.create(name: 'Test Project') }

               run_test! do |response|
                 data = JSON.parse(response.body)
                 expect(data).not_to be_empty
                 expect(data.first['name']).to eq('Test Project')
               end      
      end
    end

    post 'Creates a project' do
      tags 'Internal Projects'
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