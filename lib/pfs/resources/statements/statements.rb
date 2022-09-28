# frozen_string_literal: true

module PFS
  module Resources
    module Statements
      class Statements < Collection
        def initialize(response, attributes_collection)
          super(response, Statement, attributes_collection)
        end
      end
    end
  end
end
