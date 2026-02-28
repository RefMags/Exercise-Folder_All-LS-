require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  # Create the objects we are going to use for our tests.
  def setup
    @cash_register = CashRegister.new(200)
    @transaction = Transaction.new(9) # item cost
  end

  # This test ensures that #accept_money adds the transaction amount to the
  # cash register's total_money
  def test_accept_money
    starting_amount = @cash_register.total_money
    transaction_amount = @transaction.amount_paid = 9
    current_cash_register = @cash_register.accept_money(@transaction)

    assert_equal(starting_amount + transaction_amount, current_cash_register)
  end

  # This test ensures that we give the appropriate #change; the cash register
  # has the item cost that is deducted from the amount paid
  def test_change
    paid_amount = @transaction.amount_paid = 20
    cost_of_item = @transaction.item_cost
    actual_change = @cash_register.change(@transaction)

    # NB: the expectation should be more specific, ie not `paid_amount - cost_of_item`
    # but the value, 20-1
    # we could just put it into an `expected_change = paid_amount - cost_of_item`
    assert_equal( 11 , actual_change)
  end

  # This test ensures that we display a valid receipt; the return is `nil` while
  # the print/output it a string
  def test_give_receipt
    expected_output = "You've paid $#{@transaction.item_cost}.\n"

    assert_output(expected_output) { @cash_register.give_receipt(@transaction) }
  end
end
