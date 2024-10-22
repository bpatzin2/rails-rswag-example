module Internal
    class ProjectsController < ApplicationController
      skip_before_action :verify_authenticity_token


      class Task < T::Struct
        include SorbetJsonSchema

        const :id, Integer
        const :text, String
        const :optional_field, T.nilable(String)
      end

      class Address < T::Struct
        include SorbetJsonSchema

        const :street, String
        const :city, String
      end

      class Project < T::Struct
        include SorbetJsonSchema
      
        const :id, Integer
        const :name, String
        const :tasks, T::Array[Task]
        const :address, Address
      end

      def index
          @projects = ::Project.all
          api_projects = @projects.map { |project| Project.new(
            id: project.id,
            name: project.name,
            tasks: [],
            address: Address.new(street: '123 Main St', city: 'Anytown')
          ) }
          render json: api_projects
      end
  
      def create
        @project = ::Project.new(project_params)
        if @project.save
          render json: @project, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end
  
      private
    
      def project_params
        params.require(:project).permit(:name)
          end
      end
end