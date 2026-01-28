require 'minitest/autorun'

class TestValue < Minitest::Test
  def test_value_is_nil
    value = nil
    assert_nil value, "Value should be nil"
  end
end
