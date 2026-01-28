require 'minitest/autorun'

class TestValue < Minitest::Test
  def test_downcase_value
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
