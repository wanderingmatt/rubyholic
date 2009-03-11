require 'test_helper'

class SearchTest < Test::Unit::TestCase
  fixtures :all

  test "Groups should be indexed" do
    system("cd #{RAILS_ROOT}; rake ts:stop &> /dev/null")

    assert_nothing_raised do
      puts "Hi"
    end
    
    system("cd #{RAILS_ROOT}; rake ts:start &> /dev/null")
    end
  end
end
