module Customers
    class SwaggerController < ApplicationController
        def index
            render :index, layout: false
        end
    end
end
