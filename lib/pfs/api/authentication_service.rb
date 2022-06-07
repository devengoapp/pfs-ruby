# frozen_string_literal: true

module PFS
  module API
    class AuthenticationService < Service
      def login(username, password, options = {})
        attributes = {
          username: username,
          password: password,
        }
        response = client.post("/Auth/Jwt", attributes, options)
        Resources::Authentication::Token.new(response)
      end
    end
  end
end
