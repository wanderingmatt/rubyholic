require 'will_paginate/core_ext'

module WillPaginate
  module ViewHelpers
    def self.total_pages_for_collection(collection) #:nodoc:
      return 1
    end
  end
end