module AnyStrongParameter
  ANY = :*

  class Engine < Rails::Engine
    initializer 'any_strong_parameter' do
      ActionController::Parameters.prepend(
        Module.new do
          EMPTY_ARRAY = []
          def hash_filter(params, filter)
            filter = filter.with_indifferent_access

            slice(*filter.keys).each do |key, value|
              if filter[key] == AnyStrongParameter::ANY
                filter.delete(key)
                params[key] = value
              end
            end

            super(params, filter)
          end
        end
      )
    end
  end
end
