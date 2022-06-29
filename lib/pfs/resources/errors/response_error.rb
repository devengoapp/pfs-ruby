# frozen_string_literal: true

module PFS
  module Resources
    module Errors
      class ResponseError < Base
        attr_accessor :code,
                      :alternativeErrorCode,
                      :detail,
                      :status

        alias alternative_code alternativeErrorCode
      end
    end
  end
end
