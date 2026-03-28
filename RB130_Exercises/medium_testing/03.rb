require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(100)
  end

  def test_accept_money
    paid_amount = @transaction.amount_paid = 50
    initial_amount = @register.total_money
    @register.accept_money(@transaction)
    assert_equal initial_amount + paid_amount , @register.total_money
  end
end
=begin
CashRegister#accept_money method.
Write a test for the #accept_money method.
=end
