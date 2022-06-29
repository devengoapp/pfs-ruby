# frozen_string_literal: true

require_relative "response_error"

module PFS
  module Resources
    module Errors
      class ResponseErrors < StandardError
        attr_accessor :errors

        def initialize(error)
          errors = error.response[:body][:errors]
          @errors = errors.map { |err| ResponseError.new(error, err) }
        end
      end
    end
  end
end
