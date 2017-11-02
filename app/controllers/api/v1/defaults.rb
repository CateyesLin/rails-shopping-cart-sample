module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        # common Grape settings
        version 'v1'
        format :json
      end
    end
  end
end
