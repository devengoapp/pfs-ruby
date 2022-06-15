# frozen_string_literal: true

module PFS
  module Resources
    module Authentication
      class Token < Base
        attr_accessor :accessToken,
                      :expiresIn

        alias access_token accessToken
        alias expires_in expiresIn

        def initialize(response, attributes = {})
          super(response, attributes)
          @expires_on = Time.now + expires_in
        end

        def valid?
          @expires_on > Time.now
        end
      end
    end
  end
end
