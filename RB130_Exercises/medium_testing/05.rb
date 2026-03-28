require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(100)
  end

  def test_accept_money
    @transaction.amount_paid = 100
    paid_amount = @transaction.amount_paid

    initial_amount = @register.total_money
    @register.accept_money(@transaction)

    assert_equal initial_amount + paid_amount , @register.total_money
  end

  def test_change
    @transaction.amount_paid = 100

    change_given = @register.change(@transaction)

    assert_equal 0, change_given
  end

  def test_give_receipt
    item_cost = 100

    assert_output("You've paid $#{item_cost}.\n") { @register.give_receipt(@transaction)}
  end
end
