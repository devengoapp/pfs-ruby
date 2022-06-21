# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class Status < Base
        CODES = {
          issued: 0,
          open: 1,
          deposit_only: 4,
          closed: 9
        }
        attr_accessor :cardStatus,
                      :description

        alias code cardStatus
      end
    end
  end
end
