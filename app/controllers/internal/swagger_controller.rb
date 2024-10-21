module Internal
    class SwaggerController < ApplicationController
      def index
        render :index, layout: false
      end
    end
end