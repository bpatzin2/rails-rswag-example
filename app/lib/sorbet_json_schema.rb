module SorbetJsonSchema
    def self.included(base)
      base.extend(ClassMethods)
    end
  
    module ClassMethods
      def to_json_schema
        {
          type: :object,
          properties: props.transform_values { |options| property_to_json_schema(options) },
          required: props.select { |_, v| !v[:optional] }.keys
        }
      end
  
      private
  
      def property_to_json_schema(options)
        type = options[:type]
        schema = {}
        case
        when type == Integer
          schema[:type] = :integer
        when type == Float
          schema[:type] = :number
        when type == String
          schema[:type] = :string
        when type == TrueClass || type == FalseClass
          schema[:type] = :boolean
        when type.is_a?(T::Types::TypedArray)
          schema[:type] = :array
          schema[:items] = property_to_json_schema(type: type.type)
        when type.is_a?(T::Types::TypedHash)
          schema[:type] = :object
          schema[:additionalProperties] = property_to_json_schema(type: type.values)
        when type.is_a?(T::Types::Simple) && type.raw_type < T::Struct
            schema = type.raw_type.to_json_schema
        when type.is_a?(Class) && type < T::Struct
            schema = type.to_json_schema
        else
          byebug
          raise ArgumentError, "Unsupported type: #{type}"
        end
  
        schema[:description] = options[:doc] if options[:doc]
        schema
      end
    end
  end